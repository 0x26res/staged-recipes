#!/bin/bash
./configure

make V=1

export FLUX_TESTS_LOGFILE=t
make check
make install
