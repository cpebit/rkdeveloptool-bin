#!/bin/bash
while true
do
  echo "Waiting for device"
  while ! lsusb 2> /dev/null | grep "2207:330e" -q; do
    sleep 1
  done

  sleep 1
  ./rkdeveloptool_mac db rk3308_loader_uart0_m0_emmc_port_support_sd_20190717.bin &&
    sleep 2 &&
    ./rkdeveloptool_mac wl 0x40 "idbloader.img" &&
    ./rkdeveloptool_mac rd
  echo -e "\a"
  sleep 2
done