#!/bin/sh

echo "--- 🤖 Publishing JSONSafeEncoding ---"

FILE="./JSONSafeEncoding-Swift.podspec"
if [ ! -f "$FILE" ]; then
    echo "❌ $FILE not found!"
    exit 1
fi

NAME=$(awk '/\.name =/' "$FILE" | sed 's/.*"\(.*\)"/\1/g')
VERSION=$(awk '/\.version/' "$FILE" | awk '/[0-9]\.[0-9]\.[0-9]/' | sed 's/.version//g' | sed 's/[^0-9/.]//g')
TAG="jsonsafeencoding-${VERSION}"

echo "- 📝 Name: $NAME"
echo "- 🔢 Version: $VERSION"
echo "- 🏷️  Tag: $TAG"

echo "- 🏷️  Creating tag $TAG..."
git tag -a -f "${TAG}" -m "Pod $NAME version $VERSION update"
git push origin -v "refs/tags/${TAG}" || echo "⚠️  Tag push failed (probably already exists) - continuing..."

echo "- 📦 Publishing $NAME version $VERSION..."
pod trunk push "${FILE}" --allow-warnings

if [ $? -eq 0 ]; then
    echo "- ✅ Successfully published $NAME"
else
    echo "- ❌ Failed to publish $NAME"
    exit 1
fi

echo "--- 🎉 JSONSafeEncoding Published ---"
