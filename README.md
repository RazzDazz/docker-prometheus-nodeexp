# Container for prometheus to run on a synology nas including node exp

## Using instructions from
https://www.digitalocean.com/community/tutorials/how-to-install-prometheus-on-ubuntu-16-04

## Exposed ports:
- 9090

## Volumes
- config directory: `/opt/prometheus`
- data directory: `/var/lib/prometheus`
- log directory: `/var/log/supervisor`

## Sample directory structure on host
```
-- prometheus
    |-- config
    |-- data
    |-- log (optional)
```
