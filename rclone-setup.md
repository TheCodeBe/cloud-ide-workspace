# rclone Setup Guide

## 1. Configure rclone locally
```bash
rclone config
```

## 2. Copy config to container
```bash
# Get your rclone config
cat ~/.config/rclone/rclone.conf

# Copy content to container via VS Code terminal
```

## 3. Mount cloud storage
```bash
# In VS Code terminal
rclone mount your-remote: /workspace/cloud-files --daemon --allow-other --vfs-cache-mode full
```

## 4. Verify mount
```bash
ls /workspace/cloud-files
```

## Supported Providers
- Google Drive
- Dropbox
- OneDrive
- AWS S3
- And 40+ others