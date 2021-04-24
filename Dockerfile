FROM alpine

ARG version=1.0.0
ARG arch=x86_64

WORKDIR /speedtest_bin

# Downloads the version from 
ADD https://install.speedtest.net/app/cli/ookla-speedtest-$version-$arch-linux.tgz ./

RUN tar -xzf ookla-speedtest-*-linux.tgz && \
    rm -f $_  && \
    chmod +x speedtest

# Optional
#RUN apk update && apk upgrade && apk add bash

ENTRYPOINT [ "./speedtest", "--accept-license", "--accept-gdpr" ]