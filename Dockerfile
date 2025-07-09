FROM codercom/code-server:latest

# Install rclone
USER root
RUN curl https://rclone.org/install.sh | bash

# Install additional tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    nano \
    htop \
    && rm -rf /var/lib/apt/lists/*

# Create workspace directories
RUN mkdir -p /workspace/cloud-files
RUN mkdir -p /workspace/projects

# Install Cline extension
USER coder
RUN code-server --install-extension saoudrizwan.claude-dev

# Set workspace
WORKDIR /workspace

# Expose port
EXPOSE 8080

# Start code-server
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password", "/workspace"]