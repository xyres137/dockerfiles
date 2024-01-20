FROM alpine:latest

RUN apk --no-cache add git yq openssh-client

WORKDIR /root
COPY ./prep-script.sh prep-script.sh
COPY ./commit-version.sh commit-version.sh
COPY ./update-chart.sh update-chart.sh
COPY ./run.sh run.sh 

RUN chmod +x prep-script.sh commit-version.sh update-chart.sh run.sh
CMD ["/bin/sh"]