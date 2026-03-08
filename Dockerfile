FROM caddy:2.11-builder AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-l4/modules/l4proxy \
    --with github.com/mholt/caddy-l4/modules/l4tls \
    --with github.com/mholt/caddy-l4/modules/l4proxyprotocol

FROM caddy:2.11
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY index.html /usr/share/caddy/index.html