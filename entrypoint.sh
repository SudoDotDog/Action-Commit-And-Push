#!/bin/sh -l

USERNAME=$1
EMAIL=$2
TOKEN=$3
MESSAGE=$4
BRANCH=$5
REMOTE=$6
VERSION=$($7)

git config --global user.name $USERNAME
git config --global user.email $EMAIL

URL=$(git remote get-url $REMOTE)
REPLACED=$(echo $URL | sed "s/https:\/\//https:\/\/${USERNAME}:${TOKEN}@/")

COMBINED="$MESSAGE $VERSION"

git checkout $BRANCH
git add .
git commit -m "$COMBINED"
git remote set-url --push $REMOTE $REPLACED
git push $REMOTE $BRANCH
