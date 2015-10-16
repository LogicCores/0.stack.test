#!/bin/bash
if [ -z "$HOME" ]; then
	echo "ERROR: 'HOME' environment variable is not set!"
	exit 1
fi
# Source https://github.com/bash-origin/bash.origin
. "$HOME/.bash.origin"
function init {
	eval BO_SELF_BASH_SOURCE="$BO_READ_SELF_BASH_SOURCE"
	BO_deriveSelfDir ___TMP___ "$BO_SELF_BASH_SOURCE"
	local __BO_DIR__="$___TMP___"

    BO_sourcePrototype "$__BO_DIR__/activate.sh"


	function ReInstall {
		Install "reinstall"
	}

	function Install {
		BO_format "$VERBOSE" "HEADER" "Installing ..."


		pushd "$__BO_DIR__/../Components/admin" > /dev/null
	        if [ ! -e "bower_components" ] || [ "$1" == "reinstall" ]; then
				"$__BO_DIR__/../../cores/export/for/bower/node_modules/.bin/bower" install --allow-root --config.interactive=false
	       	fi
		popd > /dev/null


		BO_format "$VERBOSE" "FOOTER"
	}

	Install $@
}
init $@