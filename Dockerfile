ARG BUILD_FROM
FROM $BUILD_FROM

# setup base
ARG UNIMUS_VERSION

# Install unimus + auth plugin
WORKDIR /usr/src/app
ADD https://unimus.net/download/${UNIMUS_VERSION}/Unimus.jar /usr/src/app/Unimus.jar
RUN apk add --no-cache openjdk10 curl openssl musl socat pwgen

# Copy data
COPY data/run.sh /
COPY data/unimus.properties /etc/unimus/unimus.properties
COPY data/unimus.default /etc/default/unimus

WORKDIR /
CMD [ "/run.sh" ]
