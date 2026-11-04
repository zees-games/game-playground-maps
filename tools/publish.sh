#!/bin/bash
# Publishes the maps pack (licence.json and provides.json at the root travel with it).
#   tools/publish.sh VERSION [extra publish_pack.sh flags, e.g. --site URL --token-file F --lock F --dry-run]
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
V=${1:?usage: tools/publish.sh VERSION [flags]}; shift
exec "$HERE/../dot-cloud/tools/publish_pack.sh" publish --source "$HERE" --id game-playground-maps --version "$V" \
    --exclude-dir tools --exclude-dir docs --exclude-dir .github \
    --lock "$HERE/content.lock.json" "$@"
