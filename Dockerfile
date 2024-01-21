# Use an official base image with both rclone and qBittorrent
FROM linuxserver/qbittorrent:latest

# Install rclone
RUN apt-get update && \
    apt-get install -y rclone && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy your rclone config file to the container
COPY rclone.conf /root/.config/rclone/rclone.conf

# Set the working directory
WORKDIR /root

# Specify the command to run when the container starts
CMD ["rclone", "mount", "your_remote_name:/path/on/google/drive", "/path/on/container", "--allow-other", "--daemon"]
