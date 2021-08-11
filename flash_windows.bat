@echo off
cls

if "%1"=="rk3308" (
  set usb_pid="330E"
) else if "%1"=="rv1109" (
  set usb_pid="110B"
) else (
  echo Invalid device type: %1
  exit /b 1
)

echo Waiting for device...
powershell -c "while ($(GET-WMIOBJECT Win32_PnPEntity | Where { $_.DeviceID -like 'USB\VID_2207&PID_%usb_pid%*' } | measure).count -eq 0) {Start-Sleep -s 1}"
echo Device found.
.\bin\rkdeveloptool.exe db .\bin\%1.bin
echo Waiting for device to re-enumerate.
powershell -c "while ($(GET-WMIOBJECT Win32_PnPEntity | Where { $_.DeviceID -like 'USB\VID_2207&PID_%usb_pid%*' } | measure).count -eq 0) {Start-Sleep -s 1}"
.\bin\rkdeveloptool.exe wl 0 %2
.\bin\rkdeveloptool.exe rd
echo Device flashed successfully.
pause
