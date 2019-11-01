#!/usr/bin/bash

SRC_DIR="/app/src"
WWW_DIR="/var/www"
#PREFIX_JPG="bunny_"

echo container start
while true
do
if [[ $(ls ${SRC_DIR}/bunny_*.jpg 2> /dev/null|wc -l) == 0 ]]; then
  sleep 0.01
else
  mv $(ls -atr ${SRC_DIR}/bunny_*.jpg |tail -1) ${WWW_DIR}/image.jpg && rm -rf ${SRC_DIR}/${PREFIX_JPG}*.jpg
fi
done
