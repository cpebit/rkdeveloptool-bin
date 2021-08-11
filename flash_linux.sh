#!/bin/bash
set -e

echo "Waiting for device..."

while ! lsusb 2> /dev/null | grep "2207:110b" -q; do
  sleep 1
done

echo "Device found."

sleep 1

sudo ./bin/rkdeveloptool_linux db ./bin/rv1126_loader_v1.05.106.bin

echo "Waiting for device to re-enumerate."
while ! lsusb 2> /dev/null | grep "2207:110b" -q; do
  sleep 1
done

sudo ./bin/rkdeveloptool_linux wl 0 "$1"
sudo ./bin/rkdeveloptool_linux rd

echo "Device flashed successfully."