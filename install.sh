#!/bin/bash

# Copyright 2016 Alessandra Bilardi. All Rights Reserved.
# Released under the MIT License.
# Author: alessandra.bilardi@gmail.com (Alessandra Bilardi)
#
# Bash prototype.
#
# This script contains the main functions for getting options and running something

# initialize
VERSION="0.0.1"
oldScript="my-script"
SCRIPT=$oldScript

# functions

# The script version
#
# Returns:
#   string: version number
function version {
    echo MyScript Installer $VERSION
}

# The script help
#
# Returns:
#   string: script manual
function help {
    cat <<EOF
install.sh(1) -- MyScript Installer
=================================

## SYNOPSIS

\`install.sh\` [-hVs]

## OPTIONS

  \`-h, --help\`              display this message

  \`-V, --version\`           output version

  \`-s, --script-name\`       name of the new script

## USAGE

    ./install.sh -s my-script

Load structure and download prototype branch

## AUTHOR

  Alessandra Bilardi <alessandra.bilardi@gmail.com>

## REPORTING BUGS

  https://github.com/bilardi/bash-prototype/issues

## LICENSE

  MIT (C) Copyright Alessandra Bilardi 2016

EOF
    exit 1
}

# Install prototype
#
# Returns:
#   string: feedback
function install {
    if [ ! -e test.sh ]; then
	if [ ! -d test ]; then
	    mkdir -p test/sharness.test
	    echo "Create directory test/sharness.test"
	    mkdir -p test/bashunit.test
	    echo "Create directory test/bashunit.test"
	fi
	if [ ! -d test/bash-prototype ]; then
	    git clone -b prototype https://github.com/bilardi/bash-prototype.git test/bash-prototype
	    echo "Download bilardi/bash-prototype"
	fi
	cp test/bash-prototype/my-script.sh test.sh
	sed "s/$oldScript/$SCRIPT/" test/bash-prototype/Makefile > Makefile
	cp test/bash-prototype/.gitignore .
	sed "s/$oldScript/$SCRIPT/" test/bash-prototype/test/bashunit.test/functional.sh > test/bashunit.test/functional.sh
	sed "s/$oldScript/$SCRIPT/" test/bash-prototype/test/sharness.test/functional.sh > test/sharness.test/functional.sh
	echo "Update files"
    fi
}

# main
if [ -z $1 ]; then
    help
fi

## get options of the script
while true; do
    case "$1" in
	-h | --help ) help ;;
	-V | --version ) version; exit 1 ;;
	-s | --script-name ) SCRIPT=$2; install; exit 1 ;;
	-- ) shift; break ;;
	* ) break ;;
    esac
    shift
done
