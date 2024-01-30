#!/bin/sh

email=$(yq -r '.email' /gitconfig/gitconfig.yaml) &&
username=$(yq -r '.username' /gitconfig/gitconfig.yaml) &&
privatekey="$(yq -r '.private-key' /gitconfig/gitconfig.yaml)"

echo "${privatekey}"

mkdir -p ~/.ssh \
    && echo "${privatekey}" > ~/.ssh/id_ed25519 \
    && echo -e "Host github.com\n    StrictHostKeyChecking no" >> ~/.ssh/config \
    && chmod 700 ~/.ssh \
    && chmod 600 ~/.ssh/* \
    && chmod 400 ~/.ssh/id_ed25519

git config --global user.email "$email" && git config --global user.name "$username"
git config --global --add --bool push.autoSetupRemote true