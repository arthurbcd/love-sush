#!/bin/bash
CLASSPATH_FILE=".classpath"
TOMCAT_LIB="/autofs/unitytravail/travail/amonteiromir/apache-tomcat-10.1.12/lib"

# Temporary backup
cp "$CLASSPATH_FILE" "${CLASSPATH_FILE}.bak"

# Remove the line with JRE 11 and add JRE 17 (matching user environment)
sed -i 's/JavaSE-11/JavaSE-17/g' "$CLASSPATH_FILE"

# Ensure the Tomcat container is present (it seems to be already)
# But we can also add the JARs directly if the container is broken
if ! grep -q "servlet-api.jar" "$CLASSPATH_FILE"; then
    # Add explicit references to Tomcat libs as backup for Eclipse
    sed -i '/<\/classpath>/i \	<classpathentry kind="lib" path="'$TOMCAT_LIB'/servlet-api.jar"/>' "$CLASSPATH_FILE"
    sed -i '/<\/classpath>/i \	<classpathentry kind="lib" path="'$TOMCAT_LIB'/jsp-api.jar"/>' "$CLASSPATH_FILE"
fi

echo "Eclipse .classpath updated. Please refresh the project in Eclipse (F5) and run Project -> Clean."
