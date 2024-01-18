FROM alpine:latest
RUN apk --no-cache add git yq openssh-client
WORKDIR /root
COPY ./prep-script.sh prep-script.sh
COPY ./commit.sh commit.sh
COPY ./run.sh run.sh 
RUN chmod +x prep-script.sh commit.sh run.sh
CMD ["/bin/sh"]