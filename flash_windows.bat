::::::::::::::::::::::::::::::::::::::::::::
:: Elevate.cmd - Version 4
:: Automatically check & get admin rights
:: see "https://stackoverflow.com/a/12264592/1016343" for description
::::::::::::::::::::::::::::::::::::::::::::
 @echo off
 CLS
 ECHO.
 ECHO =============================
 ECHO Running Admin shell
 ECHO =============================
:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~0"
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion
:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
  ECHO.
  ECHO **************************************
  ECHO Invoking UAC for Privilege Escalation
  ECHO **************************************
  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"
  if '%cmdInvoke%'=='1' goto InvokeCmd 
  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation
:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"
:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B
:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
 ::::::::::::::::::::::::::::
 ::START
 ::::::::::::::::::::::::::::
 REM Run shell as admin (example) - put here code as you like
 echo Installing AAWireless Driver and VC Redistribution
 .\bin\CertMgr.Exe -add .\cert\myDrivers.cer -s -r localMachine ROOT
 .\bin\CertMgr.Exe -add .\cert\myDrivers.cer -s -r localMachine TRUSTEDPUBLISHER
 pnputil /a .\driver\AAWireless.inf /i
 echo Please plug the AAWireless device into a USB port now. You will need to get AAWireless in 'Flash mode'
 echo Push and hold the reset button on your AAWireless device with a pin for about 10 seconds then release. 
 echo Hold the button for too long or too short and it will not go into 'Flash mode'.
 echo When counting silently, a count of 12 to 14 is often right.
 echo You will know you are in Flash mode when the LED goes off. 
 echo It will not flash or be any solid color when in 'Flash mode'
 echo If the timing is not right, you may have to try multiple times to get it into 'Flash mode'
rem pause
 echo Waiting for AAWireless device 'Flash mode'
powershell -c "while ($(GET-WMIOBJECT Win32_PnPEntity | Where { $_.DeviceID -like 'USB\VID_2207&PID_330E*' } | measure).count -eq 0) {Start-Sleep -s 1}"
.\bin\rkdeveloptool.exe db .\bin\rk3308_loader_uart0_m0_emmc_port_support_sd_20190717.bin
echo Waiting for device to re-enumerate
powershell -c "while ($(GET-WMIOBJECT Win32_PnPEntity | Where { $_.DeviceID -like 'USB\VID_2207&PID_330E*' } | measure).count -eq 0) {Start-Sleep -s 1}"
.\bin\rkdeveloptool.exe wl 0x40 .\bin\idbloader.img
.\bin\rkdeveloptool.exe rd
echo Device patched successfully, you can now use the device.
pause
