# Use Ubuntu as the base image
FROM ubuntu:24.04

# Avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install NGINX
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy your website files
COPY . /var/www/html

# Expose HTTP port
EXPOSE 80

# Run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]


