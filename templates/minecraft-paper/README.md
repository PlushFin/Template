# Minecraft Paper Template

Starter notes for a Paper template.

## Recommended first choice

Use image template:

- `itzg/minecraft-server:stable-java21`

with env:

- `TYPE=PAPER`
- `EULA=TRUE`

This is usually more stable than building from a custom repo unless you need custom image behavior.

## If building from this catalog repo

Your template-builder must support selecting this folder's Dockerfile context.
If it only builds root Dockerfile, use image template until builder supports dockerfile/context overrides.

