#!/bin/bash

# Copyright 2016 Alessandra Bilardi. All Rights Reserved.
# Released under the MIT License.
# Author: alessandra.bilardi@gmail.com (Alessandra Bilardi)
#
# Test script.
#
# This script contains the sample functions for getting options and running your tests

# initialize
BIN="./test.sh"
source lib/test-lib.sh

# functions

# Functional tests list
#
# Returns:
#   string: test type
function functionals {
    echo Functional tests
    versionTest
}

# Integration tests list
#
# Returns:
#   string: test type
function integrations {
    echo Integration tests
}

# Test --version and -V options
function versionTest {
    local pattern="Version: [0-9]+.[0-9]+.[0-9]+"
    local result=$($BIN --version)
    like "$result" "$pattern" "versionTest --version"

    local result=$($BIN -V)
    like "$result" "$pattern" "versionTest -V"
}

# main
if [ -z $1 ]; then
    help
fi

## get options of the script
while true; do
    case "$1" in
	-h | --help ) help; exit 1 ;;
	-V | --version ) version; exit 1 ;;
	-f | --functionals ) functionals ;;
	-i | --integrations ) integrations ;;
	-- ) shift; break ;;
	* ) break ;;
    esac
    shift
done

## report
echo Test Passed: $testPassed, Test Failed: $testFailed.
