
switch_jvm() {
	VERSION=$1
	echo "Switching to Java $VERSION"
	export JAVA_HOME=$(/usr/libexec/java_home -v $VERSION)
	export PATH=${JAVA_HOME}/bin:$PATH
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