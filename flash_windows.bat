echo "Waiting for device..."
powershell -c "while ($(GET-WMIOBJECT Win32_PnPEntity | Where { $_.DeviceID -like 'USB\VID_2207&PID_110B*' } | measure).count -eq 0) {Start-Sleep -s 1}"
echo "Device found."
.\bin\rkdeveloptool.exe db .\bin\rv1126_loader_v1.05.106.bin
echo "Waiting for device to re-enumerate."
powershell -c "while ($(GET-WMIOBJECT Win32_PnPEntity | Where { $_.DeviceID -like 'USB\VID_2207&PID_110B*' } | measure).count -eq 0) {Start-Sleep -s 1}"
.\bin\rkdeveloptool.exe wl 0 %1
.\bin\rkdeveloptool.exe rd
echo "Device flashed successfully."
pause
