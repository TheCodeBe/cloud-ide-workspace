FROM codercom/code-server:latest

# Install additional tools and rclone
USER root
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    nano \
    htop \
    fuse \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install rclone
RUN curl https://rclone.org/install.sh | bash

# Create workspace directories
RUN mkdir -p /workspace/cloud-files
RUN mkdir -p /workspace/local-projects
RUN mkdir -p /workspace/temp

# Configure FUSE for rclone
RUN groupadd -f fuse && usermod -a -G fuse coder || true
RUN echo 'user_allow_other' >> /etc/fuse.conf

# Install VS Code extensions
USER coder
RUN code-server --install-extension saoudrizwan.claude-dev
RUN code-server --install-extension ms-python.python
RUN code-server --install-extension bradlc.vscode-tailwindcss
RUN code-server --install-extension esbenp.prettier-vscode
# Note: ms-vscode.vscode-json removed - JSON support is built into code-server

# Set workspace
WORKDIR /workspace

# Expose port
EXPOSE 8080

# Start code-server
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password", "/workspace"]