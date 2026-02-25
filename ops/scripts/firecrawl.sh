#!/usr/bin/env bash
# firecrawl.sh — reusable Firecrawl wrapper for the second brain
#
# Usage:
#   ./firecrawl.sh scrape <url> [output-file]
#   ./firecrawl.sh crawl  <url> [limit] [output-dir]
#   ./firecrawl.sh search <query> [limit] [output-file]
#
# Requires FIRECRAWL_API_KEY in environment or ../.env
#
# Examples:
#   ./firecrawl.sh scrape https://example.com
#   ./firecrawl.sh scrape https://example.com resources/example.md
#   ./firecrawl.sh crawl https://docs.firecrawl.dev 20 resources/firecrawl-docs/
#   ./firecrawl.sh search "youth purpose programs" 5

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORKSPACE="$(cd "$SCRIPT_DIR/../.." && pwd)"
API_BASE="https://api.firecrawl.dev/v1"

# Load API key from environment or .env
if [[ -z "${FIRECRAWL_API_KEY:-}" ]]; then
  if [[ -f "$WORKSPACE/.env" ]]; then
    export $(grep -v '^#' "$WORKSPACE/.env" | xargs)
  fi
fi

if [[ -z "${FIRECRAWL_API_KEY:-}" ]]; then
  echo "Error: FIRECRAWL_API_KEY not set. Add it to $WORKSPACE/.env" >&2
  exit 1
fi

AUTH="Authorization: Bearer $FIRECRAWL_API_KEY"
CT="Content-Type: application/json"

# ── helpers ──────────────────────────────────────────────

slugify() {
  echo "$1" | sed 's|https\?://||;s|[^a-zA-Z0-9]|-|g;s|-\+|-|g;s|^-||;s|-$||' | head -c 80
}

save_output() {
  local content="$1"
  local outfile="$2"
  mkdir -p "$(dirname "$outfile")"
  echo "$content" > "$outfile"
  echo "Saved → $outfile"
}

# ── scrape ───────────────────────────────────────────────

cmd_scrape() {
  local url="${1:?Usage: firecrawl.sh scrape <url> [output-file]}"
  local outfile="${2:-}"

  echo "Scraping: $url"

  local response
  response=$(curl -sS "$API_BASE/scrape" \
    -H "$AUTH" -H "$CT" \
    -d "{\"url\":\"$url\",\"formats\":[\"markdown\"]}")

  local success
  success=$(echo "$response" | jq -r '.success // false')

  if [[ "$success" != "true" ]]; then
    echo "Error: $(echo "$response" | jq -r '.error // .message // "unknown error"')" >&2
    exit 1
  fi

  local markdown
  markdown=$(echo "$response" | jq -r '.data.markdown // ""')
  local title
  title=$(echo "$response" | jq -r '.data.metadata.title // "Untitled"')
  local source
  source=$(echo "$response" | jq -r '.data.metadata.sourceURL // ""')

  # Build output with front matter
  local output="---
title: \"$title\"
source: $source
scraped: $(date -u +%Y-%m-%dT%H:%M:%SZ)
---

$markdown"

  if [[ -n "$outfile" ]]; then
    save_output "$output" "$outfile"
  else
    # Auto-name into inbox/
    local slug
    slug=$(slugify "$url")
    local auto="$WORKSPACE/inbox/$slug.md"
    save_output "$output" "$auto"
  fi
}

# ── crawl ────────────────────────────────────────────────

cmd_crawl() {
  local url="${1:?Usage: firecrawl.sh crawl <url> [limit] [output-dir]}"
  local limit="${2:-20}"
  local outdir="${3:-}"

  if [[ -z "$outdir" ]]; then
    local slug
    slug=$(slugify "$url")
    outdir="$WORKSPACE/inbox/crawl-$slug"
  fi

  echo "Crawling: $url (limit: $limit pages)"
  echo "Output:   $outdir/"

  # Start crawl job
  local start_response
  start_response=$(curl -sS "$API_BASE/crawl" \
    -H "$AUTH" -H "$CT" \
    -d "{\"url\":\"$url\",\"limit\":$limit,\"scrapeOptions\":{\"formats\":[\"markdown\"]}}")

  local job_id
  job_id=$(echo "$start_response" | jq -r '.id // empty')

  if [[ -z "$job_id" ]]; then
    echo "Error starting crawl: $(echo "$start_response" | jq -r '.error // .message // "unknown"')" >&2
    exit 1
  fi

  echo "Job started: $job_id"

  # Poll until complete
  local status="scraping"
  local poll_response
  while [[ "$status" == "scraping" ]]; do
    sleep 5
    poll_response=$(curl -sS "$API_BASE/crawl/$job_id" -H "$AUTH")
    status=$(echo "$poll_response" | jq -r '.status // "unknown"')
    local completed
    completed=$(echo "$poll_response" | jq -r '.completed // 0')
    local total
    total=$(echo "$poll_response" | jq -r '.total // "?"')
    echo "  Status: $status ($completed/$total)"
  done

  if [[ "$status" != "completed" ]]; then
    echo "Crawl ended with status: $status" >&2
    echo "$poll_response" | jq '.' >&2
    exit 1
  fi

  # Save each page
  mkdir -p "$outdir"
  local count
  count=$(echo "$poll_response" | jq '.data | length')
  echo "Saving $count pages..."

  for i in $(seq 0 $((count - 1))); do
    local page_url page_title page_md slug filepath
    page_url=$(echo "$poll_response" | jq -r ".data[$i].metadata.sourceURL // \"page-$i\"")
    page_title=$(echo "$poll_response" | jq -r ".data[$i].metadata.title // \"Untitled\"")
    page_md=$(echo "$poll_response" | jq -r ".data[$i].markdown // \"\"")
    slug=$(slugify "$page_url")
    filepath="$outdir/$slug.md"

    cat > "$filepath" <<EOF
---
title: "$page_title"
source: $page_url
scraped: $(date -u +%Y-%m-%dT%H:%M:%SZ)
---

$page_md
EOF
    echo "  [$((i+1))/$count] $filepath"
  done

  # Create index
  echo "# Crawl: $url" > "$outdir/index.md"
  echo "" >> "$outdir/index.md"
  echo "Crawled $(date -u +%Y-%m-%dT%H:%M:%SZ) | $count pages | limit=$limit" >> "$outdir/index.md"
  echo "" >> "$outdir/index.md"
  for i in $(seq 0 $((count - 1))); do
    local page_title slug
    page_title=$(echo "$poll_response" | jq -r ".data[$i].metadata.title // \"Untitled\"")
    page_url=$(echo "$poll_response" | jq -r ".data[$i].metadata.sourceURL // \"page-$i\"")
    slug=$(slugify "$page_url")
    echo "- [$page_title]($slug.md)" >> "$outdir/index.md"
  done

  echo "Done. Index → $outdir/index.md"
}

# ── search ───────────────────────────────────────────────

cmd_search() {
  local query="${1:?Usage: firecrawl.sh search <query> [limit] [output-file]}"
  local limit="${2:-5}"
  local outfile="${3:-}"

  echo "Searching: \"$query\" (limit: $limit)"

  local response
  response=$(curl -sS "$API_BASE/search" \
    -H "$AUTH" -H "$CT" \
    -d "{\"query\":\"$query\",\"limit\":$limit,\"scrapeOptions\":{\"formats\":[\"markdown\"]}}")

  local success
  success=$(echo "$response" | jq -r '.success // false')

  if [[ "$success" != "true" ]]; then
    echo "Error: $(echo "$response" | jq -r '.error // .message // "unknown"')" >&2
    exit 1
  fi

  local count
  count=$(echo "$response" | jq '.data | length')

  # Build combined output
  local output="---
query: \"$query\"
results: $count
searched: $(date -u +%Y-%m-%dT%H:%M:%SZ)
---

# Search: $query

"

  for i in $(seq 0 $((count - 1))); do
    local title url md
    title=$(echo "$response" | jq -r ".data[$i].metadata.title // \"Result $((i+1))\"")
    url=$(echo "$response" | jq -r ".data[$i].url // \"\"")
    md=$(echo "$response" | jq -r ".data[$i].markdown // \"\"")
    output+="## [$title]($url)

$md

---

"
  done

  if [[ -n "$outfile" ]]; then
    save_output "$output" "$outfile"
  else
    local slug
    slug=$(slugify "$query")
    local auto="$WORKSPACE/inbox/search-$slug.md"
    save_output "$output" "$auto"
  fi
}

# ── main ─────────────────────────────────────────────────

case "${1:-}" in
  scrape) shift; cmd_scrape "$@" ;;
  crawl)  shift; cmd_crawl "$@" ;;
  search) shift; cmd_search "$@" ;;
  *)
    echo "Usage: firecrawl.sh {scrape|crawl|search} ..."
    echo ""
    echo "  scrape <url> [output-file]          Scrape a single page to markdown"
    echo "  crawl  <url> [limit] [output-dir]   Crawl a site (default 20 pages)"
    echo "  search <query> [limit] [output-file] Search + scrape top results"
    exit 1
    ;;
esac
