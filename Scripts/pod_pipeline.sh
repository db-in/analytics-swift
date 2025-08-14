#!/bin/sh

echo "--- 🤖 CD Pipeline Started ---"
PODSPECS=$(find ./ -name "*.podspec" -maxdepth 1)

for FILE in $PODSPECS; do
    echo "- 🏷 Processing $FILE -"
    
    NAME=$(awk '/\.name =/' "$FILE" | sed 's/.*"\(.*\)"/\1/g')
    VERSION=$(awk '/\.version/' "$FILE" | awk '/[0-9]\.[0-9]\.[0-9]/' | sed 's/.version//g' | sed 's/[^0-9/.]//g')
    
    # Create different tag formats based on podspec name
    case $NAME in
        "Sovran")
            TAG="sovran-${VERSION}"
            ;;
        "JSONSafeEncoding")
            TAG="jsonsafeencoding-${VERSION}"
            ;;
        "Analytics-Swift")
            TAG="${VERSION}"
            ;;
        *)
            TAG="${NAME}-${VERSION}"
            ;;
    esac
    
    echo "- 🏷 Creating tag $TAG for $NAME version $VERSION -"
    git tag -a -f "${TAG}" -m "Pod $NAME version $VERSION update"
    git push origin -v "refs/tags/${TAG}"
    
    echo "- 📦 Publishing $NAME version $VERSION -"
    pod trunk push "${FILE}" --allow-warnings
    
    echo "- ✅ Completed $NAME -"
    echo ""
done

echo "--- 🎉 CD Pipeline Completed ---"
