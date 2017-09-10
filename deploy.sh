#!/bin/sh

#IMAGE_URL=https://downloads.raspberrypi.org/raspbian_latest
IMAGE_URL=https://downloads.raspberrypi.org/raspbian_lite_latest

TEMP_FILE=`mktemp`
PWD=`pwd`
wget $IMAGE_URL -O $TEMP_FILE
unzip -d $PWD $TEMP_FILE
rm $TEMP_FILE
