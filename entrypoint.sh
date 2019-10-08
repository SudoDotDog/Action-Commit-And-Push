#!/bin/sh -l

USERNAME=$1
EMAIL=$2
TOKEN=$3
MESSAGE=$4
BRANCH=$5
REMOTE=$6

git config --global user.name $USERNAME
git config --global user.email $EMAIL

URL=$(git remote get-url $REMOTE)
REPLACED=$(echo $URL | sed "s/https:\/\//https:\/\/${USERNAME}:${TOKEN}@/")

git switch -c $BRANCH
git add .

git commit -m "$MESSAGE"
git remote set-url --push $BRANCH $REPLACED
# git push --set-upstream $REMOTE $BRANCH

echo $USERNAME
echo $EMAIL
echo $MESSAGE
echo $BRANCH
echo $REMOTE
echo $URL
echo $REPLACED
