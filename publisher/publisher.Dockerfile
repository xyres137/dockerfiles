FROM docker:latest

RUN apk --no-cache add git yq openssh-client

WORKDIR /root
COPY ./build-publish.sh build-publish.sh

RUN chmod +x build-publish.sh
CMD ["/bin/sh"]