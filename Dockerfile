FROM alpine:latest

RUN apk add --no-cache curl python3 \
    && curl -L -o /usr/local/bin/playit https://github.com/playit-cloud/playit-agent/releases/latest/download/playit-linux-amd64 \
    && chmod +x /usr/local/bin/playit \
    && curl -L -o /tmp/vlmcsd.tar.gz https://github.com/Wind4/vlmcsd/releases/latest/download/binaries.tar.gz \
    && tar -xzf /tmp/vlmcsd.tar.gz -C /tmp/ \
    && cp /tmp/binaries/Linux/intel/static/vlmcsd-x64-musl-static /usr/local/bin/vlmcsd-bin \
    && chmod +x /usr/local/bin/vlmcsd-bin \
    && rm -rf /tmp/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
