#!/bin/sh

email=$(yq -r '.email' /tmp/gitconfig.yaml) &&
username=$(yq -r '.username' /tmp/gitconfig.yaml) &&
privatekey="$(yq -r '.private-key' /tmp/gitconfig.yaml)"


mkdir -p ~/.ssh \
    && echo "${privatekey}" > ~/.ssh/id_ed25519 \
    && echo -e "Host github.com\n    StrictHostKeyChecking no" >> ~/.ssh/config \
    && chmod 700 ~/.ssh \
    && chmod 600 ~/.ssh/* \
    && chmod 400 ~/.ssh/id_ed25519

git config --global user.email "$email" && git config --global user.name "$username"