#! /bin/bash

function snippet_working_dir() {
	echo "DIR=\"\$( cd \"\$( dirname \"\${BASH_SOURCE[0]}\" )\" && pwd )\""
}