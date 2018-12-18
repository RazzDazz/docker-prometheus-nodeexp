#!/bin/bash

echo "Starting supervisord to run prometheus ..." 
exec /usr/bin/supervisord --nodaemon --configuration /tmp/supervisor_prometheus_nodeexp.conf
