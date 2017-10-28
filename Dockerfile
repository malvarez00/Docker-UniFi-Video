# Unifi-Video
FROM ubuntu:16.04

LABEL maintainer="malvarez00@icloud.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get -y install \
		wget &&\ 
	apt-get clean

# Download the UniFi Video Package
RUN wget https://dl.ubnt.com/firmwares/ufv/v3.8.3/unifi-video.Ubuntu16.04_amd64.v3.8.3.deb

# Install UniFi Videoo and all the dependencies
RUN apt-get install -y \
	apt-utils \
	psmisc \
	lsb-release \
	mongodb-server \
	openjdk-8-jre-headless \
	jsvc sudo
RUN dpkg -i unifi-video.Ubuntu16.04_amd64.v3.8.3.deb
RUN apt-get -f -y install

# The installation will continue
RUN dpkg -i unifi-video.Ubuntu16.04_amd64.v3.8.3.deb

# Remove UniFi Video Package
RUN rm -rf unifi-video.Ubuntu16.04_amd64.v3.8.3.deb

# Data Path 
VOLUME /var/lib/unifi-video
# Code Path
VOLUME /usr/lib/unifi-video
# Log Path
VOLUME /var/log/unifi-video

# Port - Type (TCP/UDP) - Purpose
# 22 - TCP - SSH (NVR Side)
# 6666 - TCP - Inbound Camera Streams (NVR Side)
# 7004 - UDP - UVC-Micro Talkback (Camera Side)
# 7080 - TCP - HTTP Web UI & API (NVR Side)
# 7442 - TCP - Camera Management (NVR Side)
# 7443 - TCP - HTTPS Web UI & API (NVR Side)
# 7445 - TCP - Video over HTTP
# 7446 - TCP - Video over HTTPS
# 7447 - TCP - RTSP via the controller

EXPOSE 22 6666 7004 7080 7442 7443 7445 7446 7447

CMD "service unifi-video --full-restart"
