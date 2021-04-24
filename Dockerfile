FROM alpine

LABEL org.opencontainers.image.source=https://github.com/fralvarezcalvo/speedtest-cli

ARG binVersion=1.0.0
ARG binArch=x86_64

WORKDIR /speedtest_bin

# Downloads the version from 
ADD https://install.speedtest.net/app/cli/ookla-speedtest-$binVersion-$binArch-linux.tgz ./

RUN tar -xzf ookla-speedtest-*-linux.tgz && \
    rm -f $_  && \
    chmod +x speedtest

# Optional
#RUN apk update && apk upgrade && apk add bash

ENTRYPOINT [ "./speedtest", "--accept-license", "--accept-gdpr" ]
