#!/usr/bin/bash


while true
do
if [ -f /app/src/*.jpg ]; then
  sleep 0.01
else
  mv $(ls -atr /app/src/*.jpg |tail -1) /var/www/image.jpg && rm -rf /app/src/*.jpg
fi
done
