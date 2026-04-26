FROM itzg/minecraft-server:java21

COPY start-dispatch.sh /opt/start-dispatch.sh

ENV EULA=TRUE \
    GAME_TYPE=paper \
    ENABLE_ROLLING_LOGS=true

ENTRYPOINT ["/bin/bash", "/opt/start-dispatch.sh"]

