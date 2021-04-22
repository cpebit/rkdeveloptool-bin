#!/bin/bash
while true
do
  read -p "Press enter to start flashing..."
  ./rkdeveloptool_linux db rk3308_loader_uart0_m0_emmc_port_support_sd_20190717.bin &&
    sleep 2 &&
    ./rkdeveloptool_linux wl 0x40 "idbloader.img" &&
    ./rkdeveloptool_linux rd
done