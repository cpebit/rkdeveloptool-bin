# aawireless-dram-fix

This is the tool to fix the DRAM related issues of the second batch of AAWireless devices.
You do not need to use the tool on the devices from the first batch!

# Instructions

## MacOS (tested on Catalina and Big Sur)
- Please first install HomeBrew from your terminal:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
- Install libusb and lsusb by running "brew install lsusb libusb"
- Run ./flash_mac.sh and follow the instructions.

## Linux (tested on Ubuntu 20.04)
- libusb and lsusb should already be installed, if not install them :)
- Run ./flash_linux.sh and follow the instructions

## Windows
- Run flash_windows.bat and follow the instructions.
