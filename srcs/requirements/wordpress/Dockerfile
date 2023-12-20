
# Use Debian as the base image
FROM debian:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y apache2 php php-mysql libapache2-mod-php mysql-client && \
    rm -rf /var/lib/apt/lists/*

# Copy WordPress files to the container
COPY wordpress /var/www/html

# Set the working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache service
CMD ["apache2ctl", "-D", "FOREGROUND"]
