#!/bin/sh

echo "--- 🤖 CD Pipeline Started ---"
echo "- 🏷 Updating GIT Tag -"
FILE=$(find ./ -name *.podspec)
NAME=$(awk '/\.name =/' $FILE | sed 's/.*"\(.*\)"/\1/g')
VERSION=$(awk '/\.version/' $FILE | awk '/[0-9]\.[0-9]\.[0-9]/' | sed 's/.version//g' | sed 's/[^0-9/.]//g')
TAG="${VERSION}"
git tag -a -f "${TAG}" -m "Pod version update"
git push origin -v "refs/tags/${TAG}"

echo "- 📦 Publishing version $VERSION -"
pod trunk push "${FILE}" --allow-warnings
