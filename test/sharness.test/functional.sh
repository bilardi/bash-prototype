#!/bin/bash

# Copyright 2016 Alessandra Bilardi. All Rights Reserved.
# Released under the MIT License.
# Author: alessandra.bilardi@gmail.com (Alessandra Bilardi)
#
# Unit test.
#
# This script contains the basic test of the my-script.

# initialize
PATH=$(pwd)
BIN="$PATH/../my-script.sh"

# main
test_description="Show basic test units for my-script"

. $PATH/sharness.sh

test_expect_success "function version -V" "
    ./$BIN -V | egrep -e '[0-9]+.[0-9]+.[0-9]+'
"

test_expect_success "function version --version" "
    ./$BIN --version | egrep -e '[0-9]+.[0-9]+.[0-9]+'
"

test_done
