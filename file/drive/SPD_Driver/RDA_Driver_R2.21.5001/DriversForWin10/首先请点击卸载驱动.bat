if "%PROCESSOR_ARCHITECTURE%"=="x86" goto x86
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto x64
exit
:x64
start DriverUninstall64
exit
 
:x86
start DriverUninstall32
