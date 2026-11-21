# Clean Ubuntu box for "build it from zero" videos.
# Tools are pre-installed so episodes start at the interesting part.
FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Set to "false" for episodes that show installing Claude Code from scratch.
ARG INSTALL_CLAUDE=true

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
       ffmpeg python3 python3-venv python3-pip jq tree ripgrep \
    && rm -rf /var/lib/apt/lists/*

# uv (Python package manager)
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

USER vscode
ENV PATH="/home/vscode/.local/bin:${PATH}"

# yt-dlp for downloading source videos
RUN uv tool install yt-dlp

# Claude Code (native installer)
RUN if [ "$INSTALL_CLAUDE" = "true" ]; then \
      curl -fsSL https://claude.ai/install.sh | bash ; \
    fi

# Short prompt that looks clean on camera: "~/projects $"
RUN echo 'export PS1="\[\e[36m\]\w\[\e[0m\] $ "' >> /home/vscode/.bashrc

USER root
