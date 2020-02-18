#!/bin/bash

# This is the script called by TravisCI to do the needful.

set -euo pipefail

echo "CC is ${CC-unset}, CXX is ${CXX-unset}"
[[ -z ${CC+x}  ]] ||  ${CC} --version
[[ -z ${CCX+x} ]] || ${CCX} --version
ccache -s
ccache -z
make LIBPFC_TARGET=libpfc.so
ccache -s
lscpu
./unit-test
./uarch-bench --test-tag=~slow