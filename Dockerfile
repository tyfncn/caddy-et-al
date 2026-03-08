ARG CADDY_VERSION=2.11.1
ARG L4_VERSION=v0.0.0-20260304182434-d882e9c2661d
ARG CF_VERSION=v0.0.0-20251204174556-6dc1fbb7e925

FROM caddy:${CADDY_VERSION}-builder AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@${CF_VERSION} \
    --with github.com/mholt/caddy-l4/modules/l4proxy@${L4_VERSION} \
    --with github.com/mholt/caddy-l4/modules/l4tls@${L4_VERSION} \
    --with github.com/mholt/caddy-l4/modules/l4proxyprotocol@${L4_VERSION}

FROM caddy:${CADDY_VERSION}
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY index.html /usr/share/caddy/index.html
