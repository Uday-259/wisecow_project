FROM ubuntu:22.04

# Install bash, dos2unix, cowsay, and fortune-mod
RUN apt-get update && apt-get install -y \
    bash \
    dos2unix \
    cowsay \
    fortune-mod \
    netcat \
 && rm -rf /var/lib/apt/lists/*

# Ensure /usr/games is in PATH (where cowsay and fortune live)
ENV PATH="/usr/games:${PATH}"

# Set working directory
WORKDIR /app

# Copy your script into the container
COPY wisecow.sh .

# Convert line endings (Windows CRLF -> Linux LF) and make script executable
RUN dos2unix wisecow.sh && chmod +x wisecow.sh

# Run the script when the container starts
CMD ["./wisecow.sh"]