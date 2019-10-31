#!/usr/bin/bash


while true
do
if [[ $(ls /app/src/ |wc -l) == 0 ]]; then
  sleep 0.01
else
  mv $(ls -atr /app/src/*.jpg |tail -1) /var/www/image.jpg && rm -rf /app/src/*
fi
done
