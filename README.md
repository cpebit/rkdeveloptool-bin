# aawireless-dram-fix

This is the tool to fix the DRAM related issues of the second batch of AAWireless devices. You do not need to use the
tool on the devices from the first batch!

> :warning: Please first try to OTA update to version 1.2.3, then you don't need this fix anymore. Only use this tool if the device is too unstable to be able to apply the OTA update. 

# Instructions

## Linux (tested on Ubuntu 20.04)

- libusb and lsusb should already be installed, if not, install them :)
- Run sudo ./flash_linux.sh and follow the instructions

## Windows

- Run flash_windows.bat and follow the instructions.

## MacOS (tested on Catalina and Big Sur)

- Please first install HomeBrew: https://brew.sh/
- Install libusb and lsusb by running "brew install lsusb libusb" in a Terminal.
- Run sudo ./flash_macos.sh and follow the instructions. If you get: "rkdeveloptool_macos cannot be opened because the
  developer cannot be verified" go to System Preferences -> Security & Privacy -> General and Click "Allow anyway".
