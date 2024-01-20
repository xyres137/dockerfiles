set -e

RED='\033[0;31m'
if [ $# -eq 0 ]; then
    echo "${RED} Usage: $0 <registry> <projectdir> <image>"
    exit 1
fi

registry=$1
projectdir=$2
image=$3

cd /root
mkdir .docker
cp /tmp/.docker/config.json /root/.docker

until docker ps; do sleep 3; done;

if [ ! -e "/work/version/$image" ]; then
    touch "/work/version/$image"
    echo 0 > "$filename"
fi

CURRENT_VERSION=$(cat /work/version/$image)
NEW_VERSION=$(echo "${CURRENT_VERSION}" | awk -F. -v OFS=. '{$NF += 1 ; print}')

cd /work/pod/$image
V_TAG=$registry/$projectdir/$image:$NEW_VERSION
L_TAG=$registry/$projectdir/$image:latest

docker buildx build --tag $V_TAG --tag $L_TAG --file "$image".Dockerfile --platform linux/amd64, linux/arm64 --push .

cd /work/version
echo "$NEW_VERSION" > /tmp/new-version