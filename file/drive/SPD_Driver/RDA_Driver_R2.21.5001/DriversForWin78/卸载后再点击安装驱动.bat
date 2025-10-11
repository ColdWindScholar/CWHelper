if "%PROCESSOR_ARCHITECTURE%"=="x86" goto x86
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto x64
exit
:x64
start DPInst64
exit
 
:x86
start DPInst32
