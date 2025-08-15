#!/bin/sh

echo "--- 🤖 Publishing Sovran ---"

FILE="./SovranSwift.podspec"
if [ ! -f "$FILE" ]; then
    echo "❌ $FILE not found!"
    exit 1
fi

NAME=$(awk '/\.name =/' "$FILE" | sed 's/.*"\(.*\)"/\1/g')
VERSION=$(awk '/\.version/' "$FILE" | awk '/[0-9]\.[0-9]\.[0-9]/' | sed 's/.version//g' | sed 's/[^0-9/.]//g')
TAG="sovran-${VERSION}"

echo "- 📝 Name: $NAME"
echo "- 🔢 Version: $VERSION"
echo "- 🏷️  Tag: $TAG"

echo "- 🏷️  Creating tag $TAG..."
git tag -a -f "${TAG}" -m "Pod $NAME version $VERSION update" 2>/dev/null || echo "⚠️  Tag creation failed (probably already exists) - continuing..."
git push origin -v "refs/tags/${TAG}" 2>/dev/null || echo "⚠️  Tag push failed (probably already exists) - continuing..."

echo "- 📦 Publishing $NAME version $VERSION..."
pod trunk push "${FILE}" --allow-warnings

if [ $? -eq 0 ]; then
    echo "- ✅ Successfully published $NAME"
else
    echo "- ❌ Failed to publish $NAME"
    exit 1
fi

echo "--- 🎉 Sovran Published ---"
