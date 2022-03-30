#!/bin/bash
# Copyright (c) 2016-2022 Crave.io Inc. All rights reserved

function compile_bb10_qt53() {
    # Make the output directory if it hasn't been created already
    mkdir -p $1

    make distclean || true

    # Configure qt 5.3 for armle
    export PREFIX=$(readlink -f $1)
    export XPLATFORM=$2
    ./configure \
        -prefix ${PREFIX} \
        -xplatform ${XPLATFORM} \
        -opengl es2 \
        -nomake examples \
        -nomake tests \
        -opensource \
        -confirm-license \
        -release

    # Make and make install
    make
    make install
}

function run_inside() {
    set -x
    set -e

    cd /tmp/src/qt5

    # Compile for arm v7
    compile_bb10_qt53 ~/bin/qt5/armle blackberry-armle-v7-qcc
    # Compile for x86
    compile_bb10_qt53 ~/bin/qt5/x86   blackberry-x86-qcc

    rm -rf /tmp/src
}

function main() {
    if [ "$1" == "inside" ] ; then
        run_inside $*
}

main $*
