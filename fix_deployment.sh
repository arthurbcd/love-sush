#!/bin/bash
PROJECT_ROOT="/net/cremi/amonteiromir/espaces/travail/love-sushi"
DEPLOY_DIR="$PROJECT_ROOT/deploy"
BUILD_CLASSES="$PROJECT_ROOT/build/classes"

mkdir -p "$DEPLOY_DIR/WEB-INF/classes"
cp -r "$BUILD_CLASSES/"* "$DEPLOY_DIR/WEB-INF/classes/"

echo "Deployment structure fixed. Classes copied to $DEPLOY_DIR/WEB-INF/classes"
