# mbentley/chrome

**Warning**: this image is no longer maintained on Docker Hub but the code is left for an example.

docker image for Google Chrome (and other generic tools if you install them)
based off of debian:bullseye

To pull this image:
`docker pull mbentley/chrome`

Example usage:

```
docker run -it --rm \
  --name chrome \
  --privileged \
  --user user \
  -p 5900:5900 \
  mbentley/chrome
```

By default, this creates a container that runs XVFB + fluxbox + VNC Server with no password

## Environment variables

- `XVFB_RESOLUTION` - (default - `1440x900x24`) - Sets the display resolution and color depth
- `XVFB_TIMEOUT` - (default - `5`) - Timeout waiting for XVFB to start
- `VNC_SERVER_PASSWORD` - (default - _null_) - Sets the VNC password
