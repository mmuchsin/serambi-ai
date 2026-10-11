# syntax=docker/dockerfile:1

# ============================================================================
# Serambi.ai — jury sandbox image
#
# Purpose: give a hackathon judge a reproducible, isolated environment where
# the Bob -> MCP -> Langflow path can be exercised without host installs.
#
# This image is deliberately BORING. It has no application server of its own:
# the "product" is a verified contract between three moving parts, so the
# image ships the verification scripts and a bootstrap that imports the flow
# into a running Langflow and pulls the project UUID from it at runtime.
#
# Stage 1  builder   : fetch the flow-bootstrap CLI deps (small, cacheable)
# Stage 2  runtime  : python slim + curl + jq, scripts only
# ============================================================================

FROM python:3.11-slim AS builder

WORKDIR /wheels

# Install pip deps into a wheelhouse first so the runtime layer stays tiny
# and cacheable (manifest before source).
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir --prefix=/install requests

# ---------------------------------------------------------------------------
# Runtime
# ---------------------------------------------------------------------------
FROM python:3.11-slim AS runtime

LABEL org.opencontainers.image.title="serambi-ai" \
      org.opencontainers.image.description="Jury sandbox for the Bob -> MCP -> Langflow learning-assistant contract" \
      org.opencontainers.image.licenses="MIT"

# curl + jq: used by scripts/verify-flow.sh and scripts/verify-e2e.sh.
# ca-certificates: the MCP call goes over HTTPS when Langflow is remote.
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && apt-get install -y --no-install-recommends \
        curl \
        jq \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /install /usr/local

# Dedicated non-root user: the container only needs to run verification.
RUN groupadd --system --gid 1001 serambi && \
    useradd --system --uid 1001 --gid 1001 --create-home serambi

WORKDIR /workspace

# Only what the jury path needs. Deck binaries, screenshots, docs and host
# agent state stay out of the image.
COPY --chown=serambi:serambi flows/            /workspace/flows/
COPY --chown=serambi:serambi agents/           /workspace/agents/
COPY --chown=serambi:serambi scripts/          /workspace/scripts/
COPY --chown=serambi:serambi mcp/              /workspace/mcp/
COPY --chown=serambi:serambi research/         /workspace/research/
COPY --chown=serambi:serambi README.md         /workspace/README.md

USER serambi

# The image itself performs no long-running service; entrypoint is a thin
# dispatcher so the container is useful for both one-shot checks and shells.
#   docker compose run --rm serambi verify-flow
#   docker compose run --rm serambi verify-e2e
#   docker compose run --rm serambi bootstrap
ENTRYPOINT ["/usr/bin/env", "bash", "/workspace/scripts/docker-entrypoint.sh"]
CMD ["help"]
