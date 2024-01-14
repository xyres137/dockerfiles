FROM alpine:latest

RUN apk --no-cache add git yq

# This step assumes that the gitconfig.yaml exists in the /tmp directory. 
# (One can place the file in a secret and mount it as a volume)

RUN email=$(yq -r '.email' /tmp/gitconfig.yaml) \
    && username=$(yq -r '.username' /tmp/gitconfig.yaml) \
    && private_key=$(yq -r '.private-key' /tmp/gitconfig.yaml) \
    && public_key=$(yq -r '.public-key' /tmp/gitconfig.yaml)

WORKDIR /home

RUN mkdir -p .ssh \
    && echo "$private_key" > .ssh/id_ed25519 \
    && echo "$public_key" > .ssh/id_ed25519.pub \
    && echo -e "Host github.com\n    StrictHostKeyChecking no" >> .ssh/config \
    && chmod 700 .ssh \
    && chmod 600 .ssh/* \
    && chmod 400 .ssh/id_ed25519

RUN git config --global user.email "$email" && git config --global user.name "$username"

CMD ["/bin/sh"]