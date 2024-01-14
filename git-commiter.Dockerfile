FROM alpine:latest

RUN apk --no-cache add git yq

WORKDIR /home

RUN email=$(yq -r '.email' gitconfig.yaml) \
    && username=$(yq -r '.username' gitconfig.yaml) \
    && private_key=$(yq -r '.private-key' gitconfig.yaml) \
    && public_key=$(yq -r '.public-key' gitconfig.yaml)

RUN mkdir -p .ssh \
    && echo "$private_key" > .ssh/id_ed25519 \
    && echo "$public_key" > .ssh/id_ed25519.pub \
    && echo -e "Host github.com\n    StrictHostKeyChecking no" >> .ssh/config \
    && chmod 700 .ssh \
    && chmod 600 .ssh/* \
    && chmod 400 .ssh/id_ed25519

RUN git config --global user.email "$email" && git config --global user.name "$username"

CMD ["/bin/sh"]