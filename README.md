## Docker-UniFi-Video

```
docker run \
  --name UniFi-Video \
  -p 6666:6666 \
  -p 7080:7080 \
  -p 7443:7443 \
  -p 7445:7445 \
  -p 7446:7446 \
  -p 7447:7447 \
  -v <path>:/var/lib/unifi-video \
  -v <path>:/var/log/unifi-video
  --cap-add=DAC_READ_SEARCH \
  --cap-add=NET_BIND_SERVICE \
  --cap-add=SETGID \
  --cap-add=SETUID \
  --cap-add=SYS_ADMIN \
  --cap-add=SYS_PTRACE \
  --privileged \
  unifi-video
```

# Port - Type (TCP/UDP) - Purpose
* 7022 - TCP - SSH (NVR Side)
* 6666 - TCP - Inbound Camera Streams (NVR Side)
* 7004 - UDP - UVC-Micro Talkback (Camera Side)
* 7080 - TCP - HTTP Web UI & API (NVR Side)
* 7442 - TCP - Camera Management (NVR Side)
* 7443 - TCP - HTTPS Web UI & API (NVR Side)
* 7445 - TCP - Video over HTTP
* 7446 - TCP - Video over HTTPS
* 7447 - TCP - RTSP via the controller
