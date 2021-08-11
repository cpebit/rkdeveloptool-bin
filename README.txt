# Flash tool

# Instructions

## Linux (tested on Ubuntu 20.04)

### Installation
libusb and lsusb should already be installed, if not, install them :)

### Flashing
Run `./flash_linux.sh <image file>`

## Windows

### Installation
Download and install the Microsoft Visual C++ Redistributable: https://aka.ms/vs/16/release/vc_redist.x64.exe

### USB driver setup (you only have to do this once)
- For setting up the generic usb driver we need Zadig, download here: https://zadig.akeo.ie/
- Start Zadig.
- Put AAWireless in maskrom mode, see below.
- In Zadig do: Options --> list all devices.
- Select "Unknown device xxx" and validate the USB id is 2207 330E for the RK3308 based boards or 2207 110B for the RV1109 based boards.
- Leave everything default (WinUSB driver) and click "Install driver"
- Wait a while until the generic USB driver is installed and you're done.

### Flashing
Run `flash_windows.bat <image file>`

## MacOS (tested on Catalina and Big Sur)

### Installation
- Please first install HomeBrew: https://brew.sh/
- Install libusb and lsusb by running "brew install lsusb libusb" in a Terminal.

### Flashing
Run `./flash_macos.sh <image file>`. If you get: "rkdeveloptool_macos cannot be opened because the developer cannot be verified" go to System Preferences -> Security & Privacy -> General and Click "Allow anyway".
