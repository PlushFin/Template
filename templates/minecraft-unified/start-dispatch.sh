#!/usr/bin/env bash
set -euo pipefail

game_type="${GAME_TYPE:-paper}"
game_type="${game_type,,}"

case "${game_type}" in
  paper)
    export TYPE="${TYPE:-PAPER}"
    ;;
  spigot)
    export TYPE="${TYPE:-SPIGOT}"
    ;;
  purpur)
    export TYPE="${TYPE:-PURPUR}"
    ;;
  vanilla)
    export TYPE="${TYPE:-VANILLA}"
    ;;
  *)
    echo "Unsupported GAME_TYPE='${GAME_TYPE:-}' (supported: paper, spigot, purpur, vanilla)" >&2
    exit 1
    ;;
esac

echo "Resolved GAME_TYPE='${game_type}' to TYPE='${TYPE}'"
exec /start

