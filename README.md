# Flash tool

# Instructions

## Linux (tested on Ubuntu 20.04)

### Installation
libusb and lsusb should already be installed, if not, install them :)

### Flashing
Run `./flash_linux.sh <image file>`

## Windows

### Installation
Run install_driver_windows.bat

### Flashing
Run `flash_windows.bat <image file>`

## MacOS (tested on Catalina and Big Sur)

### Installation
- Please first install HomeBrew: https://brew.sh/
- Install libusb and lsusb by running "brew install lsusb libusb" in a Terminal. 

### Flashing
Run `./flash_macos.sh <image file>`. If you get: "rkdeveloptool_macos cannot be opened because the developer cannot be verified" go to System Preferences -> Security & Privacy -> General and Click "Allow anyway".
