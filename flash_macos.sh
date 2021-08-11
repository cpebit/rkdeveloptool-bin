#!/bin/bash
set -e

usb_pid=""

wait_for_device() {
  while ! lsusb 2>/dev/null | grep "2207:$usb_pid" -q; do
    sleep 1
  done
}

case $1 in
"rk3308") usb_pid="330e" ;;
"rv1109") usb_pid="110b" ;;
*)
  echo "Invalid device type: $1"
  exit 1
  ;;
esac

echo "Waiting for device..."
wait_for_device
echo "Device found."
sleep 1
sudo ./bin/rkdeveloptool_macos db ./bin/"$1".bin
echo "Waiting for device to re-enumerate."
wait_for_device
sudo ./bin/rkdeveloptool_macos wl 0 "$2"
sudo ./bin/rkdeveloptool_macos rd
echo "Device flashed successfully."
