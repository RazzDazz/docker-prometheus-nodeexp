FROM razzle/docker-prometheus:latest
MAINTAINER RazzDazz
# Using instructions from
# https://www.digitalocean.com/community/tutorials/how-to-install-prometheus-on-ubuntu-16-04

ENV NODE_EXPORTER_VER v0.15.1
ENV NODE_EXPORTER_TAR node_exporter-0.15.1.linux-amd64.tar.gz
ENV NODE_EXPORTER_TAR_FOLDER node_exporter-0.15.1.linux-amd64

# Create User
RUN useradd --no-create-home --shell /bin/false node_exporter

# Download and extract Node Exporter
RUN mkdir -p /tmp/nodeexporter && \
    cd /tmp/nodeexporter/ && \
    curl -LO https://github.com/prometheus/node_exporter/releases/download/{NODE_EXPORTER_VER}/{NODE_EXPORTER_TAR} && \
    tar xvf ${NODE_EXPORTER_TAR} && \
    cp ${NODE_EXPORTER_TAR_FOLDER}/node_exporter /usr/local/bin/ && \
    rm -rf /tmp/nodeexporter

# Set User Rights
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Copy helper scripts into container
COPY docker-entrypoint.sh /tmp/
RUN chmod 777 /tmp/docker-entrypoint.sh
COPY supervisor_prometheus_nodeexp.conf /tmp/
             
# Start prometheus using supervisor
VOLUME /var/logs/supervisor
CMD ["/tmp/docker-entrypoint.sh"]
