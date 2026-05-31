FROM n8nio/n8n:latest
USER root

# Get apk from Alpine image used by n8n (Currently 3.22)
COPY --from=alpine:3.22 /sbin/apk /sbin/apk
COPY --from=alpine:3.22 /lib/apk /lib/apk
COPY --from=alpine:3.22 /etc/apk /etc/apk

# Install the needed system packages
RUN apk update && apk add --no-cache exiftool

# Install the desired npm packages, locking the version
# exiftool-vendored: https://www.npmjs.com/package/exiftool-vendored?activeTab=versions
RUN npm install -g exiftool-vendored@35.20.0

# Install the desired python libraries
# RUN pip3 install --no-cache-dir <INSERT_HERE> --break-system-packages

USER node