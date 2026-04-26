# Rust (Oxide/uMod) Template

This is a starter shell for a Rust server template.

## Notes

- Default game port is usually `28015` UDP.
- RCON is typically `28016` TCP.
- Storage should be required and mounted at `/data`.

## Image strategy

You can start from a community Rust dedicated server image and add your own startup/environment conventions.

If your platform expects only one Dockerfile at repo root, this folder acts as documentation until builder supports per-template Dockerfile/context selection.

