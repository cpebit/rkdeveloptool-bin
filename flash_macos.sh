#!/bin/bash
set -e

echo "Waiting for device"

while ! lsusb 2> /dev/null | grep "2207:110b" -q; do
  sleep 1
done

echo "Device found"

sleep 1

./bin/rkdeveloptool_macos db ./bin/rv1126_loader_v1.05.106.bin

echo "Waiting for device to re-enumerate"
while ! lsusb 2> /dev/null | grep "2207:110b" -q; do
  sleep 1
done

./bin/rkdeveloptool_macos wl "$1"
./bin/rkdeveloptool_macos rd

echo "Device flashed successfully."