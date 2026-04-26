# Template Catalog Starter

This starter gives you a single repo layout for game templates (Minecraft, Rust, etc.) that can be used by your platform templates UI.

## What this repo is for

- Keep all game template definitions in one place.
- Keep per-template Docker build sources in one place.
- Copy values from `templates.json` into `Admin -> Templates`.

## Structure

- `templates.json` - catalog entries to copy into your admin UI
- `templates/minecraft-paper/` - starter Dockerfile + notes for Paper
- `templates/minecraft-unified/` - one-image dispatcher example using `GAME_TYPE`
- `templates/rust-oxide/` - starter Dockerfile + notes for Rust (Oxide/uMod)

## How to use

1. Push this folder as its own GitHub repo (for example `JosephLassuy/server-template-catalog`).
2. For each entry in `templates.json`, create a template in your admin UI.
3. For `sourceType = github`, use:
   - `sourceRepoUrl`: your catalog repo URL
   - `sourceRepoRef`: branch (`main` recommended)
4. If your template-builder only builds from root `Dockerfile`, put a dispatcher-style root image in this repo and use env vars to choose behavior.

## One image, many variants (like docker-minecraft-server)

The `templates/minecraft-unified` example shows a dispatch pattern:

- Template defaults set `GAME_TYPE=paper` (or `spigot`, `purpur`)
- Entrypoint script maps that to the upstream image's `TYPE`
- Same built image supports multiple variants based on env

Example mapping:

- `GAME_TYPE=paper` -> `TYPE=PAPER`
- `GAME_TYPE=spigot` -> `TYPE=SPIGOT`
- `GAME_TYPE=purpur` -> `TYPE=PURPUR`

## Root build note

This starter now includes a root `Dockerfile` and `start-dispatch.sh` for Minecraft variants.
That means root-repo GitHub builds are Minecraft-focused.

Use a separate repo (or image template) for Rust unless your builder supports selecting a different Dockerfile/context per template.

## Recommended defaults

- Minecraft Paper:
  - protocol: `tcp`
  - game port: `25565`
  - requires storage: `true`
  - mount path: `/data`
- Rust:
  - protocol: `udp`
  - game port: `28015`
  - requires storage: `true`
  - mount path: `/data`

