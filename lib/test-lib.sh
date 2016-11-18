#!/bin/bash

# Copyright 2016 Alessandra Bilardi. All Rights Reserved.
# Released under the MIT License.
# Author: alessandra.bilardi@gmail.com (Alessandra Bilardi)
#
# Test library.
#
# This script contains the basic functions for running your tests

# initialize
VERSION="0.0.1"
testPassed=0
testFailed=0

# functions

# The script version
#
# Returns:
#   string: version number
function version {
    echo Version: $VERSION
}

# The script help
#
# Returns:
#   string: script manual
function help {
    cat <<EOF
test.sh(1) -- Test script
=================================

## SYNOPSIS

\`test.sh\` [-hVfi]

## OPTIONS

  \`-h, --help\`              display this message

  \`-V, --version\`           output version

  \`-f, --functionals\`       run functional tests

  \`-i, --integrations\`      run integration tests

## USAGE

  Follow sample test.sh script for getting options, and where add your tests
  
    ./test.sh --functionals

  runs functional tests and reports how many tests pass and how many tests fail

    ./test.sh --integrations

  runs integration tests and reports how many tests pass and how many tests fail

## AUTHOR

  - Alessandra Bilardi <alessandra.bilardi@gmail.com>

## REPORTING BUGS

  - https://github.com/bilardi/bash-utils/issues

## SEE ALSO

  \`regexp\`(1)

## LICENSE

  MIT (C) Copyright Alessandra Bilardi 2016

EOF
}

# Test if result contains pattern
#
# Args:
#   result: string: result of the script test
#   pattern: string: regexp expected
#   message: string: name of function caller
# Returns:
#   mixed: string: error message
function like {
    if [[ $1 =~ $2 ]]; then
	testPassed=$(( $testPassed + 1 ))
    else
	testFailed=$(( $testFailed + 1 ))
	echo " Error on function $3"
    fi
}

# Test if result is the same with value
#
# Args:
#   result: string: result of the script test
#   value: string: string expected
#   message: string: name of function caller
# Returns:
#   mixed: string: error message
function same {
    if [[ "$1" == "$2" ]]; then
	testPassed=$(( $testPassed + 1 ))
    else
	testFailed=$(( $testFailed + 1 ))
	echo " Error on function $3"
    fi
}
