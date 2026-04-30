#!/usr/bin/env bash
# Used by `railpack prepare` (template-builder) — do not remove. Plain Docker/itzg flows use
# Dockerfile + start-dispatch.sh; those are separate from the Railpack build path.
set -euo pipefail
cd "$(dirname "$0")"

: "${EULA:=TRUE}"
: "${GAME_TYPE:=paper}"
: "${MINECRAFT_VERSION:=1.21.4}"
: "${DATA_DIR:=/data}"
MEM="${JAVA_MAX_MEMORY:-2G}"

if [[ ! "${EULA}" =~ ^(true|TRUE|yes|1)$ ]]; then
	echo "Set EULA=TRUE to accept the Minecraft EULA" >&2
	exit 1
fi

g="${GAME_TYPE,,}"
if [[ "$g" != "paper" ]]; then
	echo "This repo root (Railpack) currently supports only GAME_TYPE=paper. Got: ${GAME_TYPE}" >&2
	echo "For Spigot/Purpur/itzg, use a Docker-only template or extend start.sh + railpack.json." >&2
	exit 1
fi

echo "eula=true" >eula.txt

# Persist runtime server data in mounted storage (default /data), not image layer (/app).
mkdir -p "${DATA_DIR}"
cd "${DATA_DIR}"

# Paper API uses "STABLE" (older metadata may use "default"); pick highest build number.
BUILDS_JSON="$(curl -fsSL "https://api.papermc.io/v2/projects/paper/versions/${MINECRAFT_VERSION}/builds")"
read -r BUILD JAR_NAME <<<"$(echo "${BUILDS_JSON}" | jq -r \
	'[.builds[] | select(.channel == "STABLE" or .channel == "default")] | max_by(.build) | [.build, .downloads.application.name] | @tsv')"
if [[ -z "${BUILD}" || -z "$JAR_NAME" || "$BUILD" == "null" ]]; then
	echo "No STABLE/default-channel Paper build for ${MINECRAFT_VERSION} (see api.papermc.io)" >&2
	exit 1
fi
URL="https://api.papermc.io/v2/projects/paper/versions/${MINECRAFT_VERSION}/builds/${BUILD}/downloads/${JAR_NAME}"
if [[ ! -f "${JAR_NAME}" ]]; then
	echo "Downloading ${JAR_NAME} from Paper API..."
	curl -fSL -o "${JAR_NAME}" "${URL}"
fi

echo "Starting Paper (${JAR_NAME})..."
exec java -Xms512M -Xmx"${MEM}" -jar "${JAR_NAME}" nogui
