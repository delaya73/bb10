#!/bin/bash
# BASE_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR="/home/admin/bin/bbndk"
ARCH=armle-v7
# ARCH=x86
TARGET=qnx6

LATEST_LINUX_JRE=`ls -lrt $BASE_DIR/features | awk '/com.qnx.tools.jre.linux/ {f=$NF};END{print f}'`
QNX_HOST="$BASE_DIR/host_10_3_1_12/linux/x86"
QNX_TARGET="$BASE_DIR/target_10_3_1_995/$TARGET"
QNX_CONFIGURATION="$HOME/.rim/bbndk"
MAKEFLAGS="-I$QNX_TARGET/usr/include"
PATH="$QNX_HOST/usr/bin:$QNX_CONFIGURATION/bin:$BASE_DIR/features/$LATEST_LINUX_JRE/jre/bin:$QNX_HOST/usr/python32/bin:$PATH"
LD_LIBRARY_PATH="$QNX_HOST/usr/lib:$QNX_TARGET/armle-v7/usr/lib:$QNX_TARGET/armle-v7/lib:$LD_LIBRARY_PATH"
CPUVARDIR=$ARCH
QDE="$BASE_DIR"

export QNX_TARGET QNX_HOST QNX_CONFIGURATION MAKEFLAGS CPUVARDIR LD_LIBRARY_PATH PATH QDE
