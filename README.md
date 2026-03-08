# Caddy with Plugins

A custom Caddy web server build with additional plugins.

## Included Plugins

- [Cloudflare DNS](https://github.com/caddy-dns/cloudflare) - ACME DNS challenge provider for Cloudflare
- [caddy-l4](https://github.com/mholt/caddy-l4) - Layer 4 proxy module
  - `l4proxy` - TCP/UDP proxy
  - `l4tls` - TLS termination at layer 4
  - `l4proxyprotocol` - PROXY protocol support

### Build with Docker

```bash
docker build -t caddy-et-al .
```

### Run with Docker Compose

```bash
# Set your Cloudflare credentials
export CLOUDFLARE_EMAIL=your-email@example.com
export CLOUDFLARE_API_TOKEN=your-api-token

docker compose up -d
```

## Configuration

The included `Caddyfile` demonstrates:

- Layer 4 proxying for ports 25 (SMTP), 993 (IMAPS), 465 (SMTPS), 4190 (Mail)
- Basic HTTP file server on port 80
- TLS with internal CA
- Reverse proxy to mail server with PROXY protocol
