# Use a base image that supports systemd, for example, Ubuntu
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
apt-get install -y shellinabox && \
apt-get install -y systemd && \
apt install sudo -y
apt install nano -y
apt install bash -y
apt install curl -y
apt install npm -y
apt install python -y
apt install openjdk-17-jdk openjdk-17-jre -y
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo 'root:root' | chpasswd
# Expose the web-based terminal port
EXPOSE 3200

# Start shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
