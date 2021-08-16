# Flash tool

# Instructions

## Linux (tested on Ubuntu 20.04)

### Installation

libusb and lsusb should already be installed, if not, install them :)

### Flashing

Run `./flash_linux.sh <rv1109 or rk3308> <image file>`

## Windows

### Installation

Download and install the Microsoft Visual C++ Redistributable: https://aka.ms/vs/16/release/vc_redist.x64.exe

### USB driver setup (you only have to do this once)

Run driver/<rv1109 or rk3308>/InstallDriver.exe

### Flashing

Run `flash_windows.bat <rv1109 or rk3308> <image file>`

## MacOS (tested on Catalina and Big Sur)

### Installation

- Please first install HomeBrew: https://brew.sh/
- Install libusb and lsusb by running "brew install lsusb libusb" in a Terminal.

### Flashing

Run `./flash_macos.sh <rv1109 or rk3308> <image file>`. If you get: "rkdeveloptool_macos cannot be opened because the
developer cannot be verified" go to System Preferences -> Security & Privacy -> General and Click "Allow anyway".
