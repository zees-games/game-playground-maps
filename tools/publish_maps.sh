#!/bin/bash
# Publishes each map as its own pack (id = the map id, a member of this repository's collection asset): the pack a
# hotspot "Play map" link (`--solo-map <id>`) mounts instead of the whole game-playground-maps. tools/publish.sh still publishes the whole pack.
#   tools/publish_maps.sh [MAP_ID...] -- --member-of ASSET [--site URL --token-file F --dry-run ...]
# No MAP_ID = every maps/*.json. A pack holds maps/<id>.json, its licence.json entries and a one-entry provides.json.
# --member-of is required: a bare publish of a map pack creates a Workshop page of its own. The first publish of a map is
# 1.0.0, later ones --bump patch; maps.lock.json pins them (content.lock.json stays the whole pack's, which bootstrap fetches).
# DOT_CLOUD overrides the dot-cloud checkout (default: the sibling ../dot-cloud).
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IDS=(); while [ $# -gt 0 ] && [ "$1" != "--" ]; do IDS+=("$1"); shift; done
[ $# -gt 0 ] && shift
FLAGS=("$@")
[[ " ${FLAGS[*]} " == *" --member-of "* ]] || { echo "publish_maps.sh: --member-of ASSET is required (this repository's collection asset)" >&2; exit 2; }
[ ${#IDS[@]} -gt 0 ] || mapfile -t IDS < <(cd "$HERE/maps" && ls *.json | sed 's/\.json$//')
LOCK="$HERE/maps.lock.json"
STAGE="$(mktemp -d)"; trap 'rm -rf "$STAGE"' EXIT
for id in "${IDS[@]}"; do
    [[ "$id" =~ ^[a-z0-9][a-z0-9_-]{0,63}$ ]] || { echo "not a map id: $id" >&2; exit 2; }
    rm -rf "${STAGE:?}/$id"; mkdir -p "$STAGE/$id/maps"
    python3 -I - "$HERE" "$id" "$STAGE/$id" <<'PY'
import json, os, shutil, sys
repo, mid, out = sys.argv[1:4]
rel = "maps/%s.json" % mid
with open(os.path.join(repo, "provides.json"), encoding="utf-8") as f:
    provides = json.load(f)
entries = [e for e in provides["entries"] if e.get("id") == mid and e.get("scene") == rel]
if len(entries) != 1:
    sys.exit("%s: provides.json has %d entries for it (run tools/build_provides.py)" % (mid, len(entries)))
provides["entries"] = entries
provides["title"] = entries[0].get("name", mid)
with open(os.path.join(repo, "licence.json"), encoding="utf-8") as f:
    licence = json.load(f)
mine = [dict(e, paths=[p for p in e["paths"] if p == rel]) for e in licence if rel in e.get("paths", [])]
root = [e for e in licence if "" in e.get("paths", [])]
shutil.copy(os.path.join(repo, rel), os.path.join(out, rel))
for name, doc in (("provides.json", provides), ("licence.json", root + mine)):
    with open(os.path.join(out, name), "w", encoding="utf-8") as f:
        json.dump(doc, f, indent=4)
        f.write("\n")
PY
    VER=(--version 1.0.0)
    [ -f "$LOCK" ] && grep -q "\"gamemann/$id\"" "$LOCK" && VER=(--bump patch)
    # The site allows a few claims a minute: on 429 wait and try again (nothing was claimed).
    for try in 1 2 3 4 5 6; do
        rc=0; out="$("${DOT_CLOUD:-$HERE/../dot-cloud}/tools/publish_pack.sh" publish --source "$STAGE/$id" --id "$id" "${VER[@]}" \
            --no-import --lock "$LOCK" "${FLAGS[@]}" 2>&1)" || rc=$?
        printf '%s\n' "$out"
        [ $rc -ne 0 ] && grep -q rate_limited <<<"$out" && [ $try -lt 6 ] && { sleep 40; continue; }
        [ $rc -eq 0 ] || exit $rc
        break
    done
done
