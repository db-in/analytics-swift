#!/bin/sh

# 🔧 CONFIGURATION - Which pods to publish
PUBLISH_SOVRAN=false
PUBLISH_JSONSAFEENCODING=false
PUBLISH_ANALYTICS_SWIFT=true

echo "--- 🤖 CD Pipeline Started ---"
PODSPECS=$(find ./ -name "*.podspec" -maxdepth 1)

for FILE in $PODSPECS; do
    NAME=$(awk '/\.name =/' "$FILE" | sed 's/.*"\(.*\)"/\1/g')
    
    # Check if this pod should be published
    SHOULD_PUBLISH=false
    case $NAME in
        "Sovran")
            SHOULD_PUBLISH=$PUBLISH_SOVRAN
            ;;
        "JSONSafeEncoding")
            SHOULD_PUBLISH=$PUBLISH_JSONSAFEENCODING
            ;;
        "Analytics-Swift")
            SHOULD_PUBLISH=$PUBLISH_ANALYTICS_SWIFT
            ;;
    esac
    
    if [ "$SHOULD_PUBLISH" = false ]; then
        echo "⏭️  Skipping $NAME (disabled)"
        continue
    fi
    
    echo "- 🏷 Processing $FILE -"
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
