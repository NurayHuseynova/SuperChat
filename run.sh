#!/usr/bin/env bash
# Serve SuperChat locally. Requires Python 3 only.
cd "$(dirname "$0")"
echo "SuperChat running at http://localhost:8000  (Ctrl+C to stop)"
python3 -m http.server 8000
