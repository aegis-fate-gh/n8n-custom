FROM n8nio/n8n:latest
USER root

# Get apk from Alpine image used by n8n (Currently 3.22)
COPY --from=alpine:3.22 /sbin/apk /sbin/apk
COPY --from=alpine:3.22 /lib/apk /lib/apk
COPY --from=alpine:3.22 /etc/apk /etc/apk

# Install the needed system packages
RUN apk update && apk add --no-cache perl python3 py3-pip

# Install the needed python libraries
RUN pip3 install --no-cache-dir os datetime --break-system-packages

USER node