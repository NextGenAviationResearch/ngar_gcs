FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

ARG ARDUDECK_VERSION=0.0.29
ARG ARDUDECK_SHA256=8758acc5f53f03ec9e3e481105eb65a2fd7a5b1cef4f38ce39176238985764b4

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        libasound2 \
        libdrm2 \
        libgbm1 \
    && curl -fsSL -o /tmp/ardudeck.deb "https://github.com/rubenCodeforges/ardudeck/releases/download/v${ARDUDECK_VERSION}/ArduDeck-${ARDUDECK_VERSION}-linux-amd64.deb" \
    && echo "${ARDUDECK_SHA256}  /tmp/ardudeck.deb" | sha256sum -c - \
    && apt-get install -y --no-install-recommends /tmp/ardudeck.deb \
    && rm -f /tmp/ardudeck.deb \
    && rm -rf /var/lib/apt/lists/*

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]