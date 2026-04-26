# Starter Rust server image example.
# Replace base image with the Rust server image you trust for production.
FROM didstopia/rust-server:latest

# Keep server data under /data for storage attachment.
VOLUME ["/data"]

# Example environment defaults; adjust for your preferred image contract.
ENV RUST_SERVER_STARTUP_ARGUMENTS="+server.level \"Procedural Map\" +server.seed 12345 +server.worldsize 3000 +server.maxplayers 50 +server.hostname \"My Rust Server\" +server.description \"Hosted on PlushServer\" +server.identity \"rust-main\" +rcon.port 28016 +rcon.password \"CHANGE_ME\" +rcon.web 1"

