# BTMS Telemetry Extensions

The only significant files are the `Dockerfile`, the nginx `routes.conf` files and the new `start.sh` script. 

This loads and starts the standard **grafana** image. It also starts **nginx** that routes grafana UI and HTTP/protobuf to the separate grafana ports, and returns a default health endpoint. 