#!/bin/bash
set -e

echo Please plug the AAWireless device into a USB port now. You will need to get AAWireless in 'Flash mode'
echo Push and hold the reset button on your AAWireless device with a pin for about 10 seconds then release.
echo Hold the button for too short or too long and it will not go into 'Flash mode'.
echo When counting silently, a count of 12 to 14 is often right.
echo You will know you are in Flash mode when the LED goes off.
echo It will not flash or be any solid color when in 'Flash mode'
echo If the timing is not right, you may have to try multiple times to get it into 'Flash mode'
echo Waiting for AAWireless device 'Flash mode'

while ! lsusb 2> /dev/null | grep "2207:330e" -q; do
  sleep 1
done

sleep 1
./bin/rkdeveloptool_linux db ./bin/rk3308_loader_uart0_m0_emmc_port_support_sd_20190717.bin
sleep 2
./bin/rkdeveloptool_linux wl 0x40 ./bin/idbloader.img
./bin/rkdeveloptool_linux rd

echo Device patched successfully, you can now use the device.