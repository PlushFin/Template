# Minecraft Unified Template

This folder demonstrates a "one built image, many runtime types" pattern.

## How it works

- Base image: `itzg/minecraft-server:java21`
- Startup script reads `GAME_TYPE`
- Script maps `GAME_TYPE` -> upstream `TYPE`
- It then executes `/start` from the upstream image

## Supported GAME_TYPE values

- `paper`
- `spigot`
- `purpur`
- `vanilla`

## Suggested template env JSON examples

Paper:

`{"GAME_TYPE":"paper","EULA":"TRUE","ENABLE_ROLLING_LOGS":"true"}`

Spigot:

`{"GAME_TYPE":"spigot","EULA":"TRUE","ENABLE_ROLLING_LOGS":"true"}`

Purpur:

`{"GAME_TYPE":"purpur","EULA":"TRUE","ENABLE_ROLLING_LOGS":"true"}`

