@echo off
SET THEFILE=LancamentoExtrato.exe
echo Linking %THEFILE%
D:\lazarus\fpc\2.6.0\bin\i386-win32\ld.exe -b pei-i386 -m i386pe  --gc-sections   --subsystem windows --entry=_WinMainCRTStartup    -o LancamentoExtrato.exe link.res
if errorlevel 1 goto linkend
D:\lazarus\fpc\2.6.0\bin\i386-win32\postw32.exe --subsystem gui --input LancamentoExtrato.exe --stack 16777216
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
