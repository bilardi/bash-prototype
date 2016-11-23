# Bash prototype

This package contains a script with the main functions for getting options and running something.
It is part of the [educational repositories](https://github.com/pandle/materials) to learn how to write stardard code and common uses of the TDD.

## Installation

The package is not self-consistent: add the script where you want and run the test

    make test

Or if you want to use it as the prototype / base of your script, 

    curl -o https://raw.githubusercontent.com/bilardi/bash-prototype/master/install.sh
   
    bash install.sh -s name-of-your-script

It installs .gitignore, Makefile and test.sh in '.' directory, [bilardi/bashunit](https://github.com/bilardi/bashunit) in test/bashunit and a sample of test script in test/bashunit.test/functional.sh.

## Usage

Read the [guide](my-script.1.md).
If you installed it as the prototype / base of your script,

   bash test.sh --functional-tests

## Development

Create man (using [kapouer/ronnjs](https://github.com/kapouer/ronnjs))

    make man

## License

This package is released under the MIT license.  See [LICENSE](LICENSE) for details.

