FROM itzg/minecraft-server:java21

# Wrapper dispatch script sets TYPE from GAME_TYPE.
COPY start-dispatch.sh /opt/start-dispatch.sh

# Keep defaults minimal and override per-template via env JSON.
ENV EULA=TRUE \
    GAME_TYPE=paper \
    ENABLE_ROLLING_LOGS=true

ENTRYPOINT ["/bin/bash", "/opt/start-dispatch.sh"]

