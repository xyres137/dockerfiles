FROM alpine:latest
RUN apk --no-cache add git yq openssh-client
WORKDIR /home
COPY ./prep-script.sh prep-script.sh
RUN chmod +x prep-script.sh
CMD ["/bin.sh"]