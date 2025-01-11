# Use a base image with Python pre-installed (for your web server)
FROM python:3.9-slim

# Update and install Tor
RUN apt-get update && apt-get install -y tor

# Set up the working directory inside the container
WORKDIR /app

# Copy your application files into the container
COPY . /app

# Copy the Tor configuration file
COPY torrc /etc/tor/torrc

# Expose the port your application will run on
EXPOSE 8080

# Start Tor and the web server together
CMD ["sh", "-c", "tor & python3 -m http.server 8080"]
