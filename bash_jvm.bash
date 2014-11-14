#! /bin/bash

# Java options
export JAVA_OPTS="-Dfile.encoding=UTF-8"
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"

# Maven
export MAVEN_OPTS="-Djava.awt.headless=true"

switch_jvm() {
	VERSION=$1
	echo "Setting JVM version to $VERSION"
	export JAVA_HOME=$(/usr/libexec/java_home -v $VERSION)
	export PATH=${JAVA_HOME}/bin:$PATH
	echo "Using options:"
	echo "JAVA_OPTS : $JAVA_OPTS"
	echo "JAVA_TOOL_OPTIONS : $JAVA_TOOL_OPTIONS"
	echo "MAVEN_OPTS : $MAVEN_OPTS"
}

jvm6() {
	switch_jvm "1.6"
}

jvm7() {
	switch_jvm "1.7"
}

jvm8() {
	switch_jvm "1.8"
}

default_jvm() {
	jvm7
}