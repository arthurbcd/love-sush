#!/bin/bash

# Configuration
PROJECT_DIR="/Users/art/Documents/GitHub/love-sush"
TOMCAT_WEBAPPS="/opt/homebrew/opt/tomcat@10/libexec/webapps"
JAVA_HOME_17="/opt/homebrew/opt/openjdk@17"
TOMCAT_LIB="/opt/homebrew/opt/tomcat@10/libexec/lib/servlet-api.jar"
INDEX_JSP="$PROJECT_DIR/src/main/webapp/index.jsp"

echo "🚀 Starting build and redeploy..."

# 1. Update version in index.jsp
CURRENT_VER=$(grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+' "$INDEX_JSP")
IFS='.' read -r major minor patch <<< "${CURRENT_VER#v}"
NEW_PATCH=$((patch + 1))
NEW_VER="v$major.$minor.$NEW_PATCH"

echo "📦 Updating version: $CURRENT_VER -> $NEW_VER"
sed -i '' "s/$CURRENT_VER/$NEW_VER/g" "$INDEX_JSP"

# 2. Compile
echo "🔨 Compiling Java classes..."
mkdir -p "$PROJECT_DIR/build/classes"
"$JAVA_HOME_17/bin/javac" -d "$PROJECT_DIR/build/classes" \
    -cp "$PROJECT_DIR/src/main/webapp/WEB-INF/lib/*:$TOMCAT_LIB" \
    $(find "$PROJECT_DIR/src/main/java" -name "*.java")

# 3. Package WAR
echo "📦 Packaging WAR..."
mkdir -p "$PROJECT_DIR/build/war/WEB-INF/classes"
cp -r "$PROJECT_DIR/src/main/webapp/"* "$PROJECT_DIR/build/war/"
cp -r "$PROJECT_DIR/build/classes/"* "$PROJECT_DIR/build/war/WEB-INF/classes/"
cd "$PROJECT_DIR/build/war" && jar cvf ../love-sush.war * > /dev/null

# 4. Deploy
echo "🚚 Deploying to Tomcat..."
# Deploy by expanding directly into the folder to ensure immediate update
rm -rf "$TOMCAT_WEBAPPS/love-sush"
mkdir -p "$TOMCAT_WEBAPPS/love-sush"
cp -r "$PROJECT_DIR/build/war/"* "$TOMCAT_WEBAPPS/love-sush/"

echo "✅ Done! Application updated to $NEW_VER"
