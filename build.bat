@echo off
if not exist "%CD%\Soleil" mkdir "%CD%\Soleil"
del "%CD%\Soleil\*.*" /f /s /q

if defined ProgramFiles(x86) (
xcopy64 "%CD%\*.dll" "%CD%\Soleil" /y
xcopy64 "%CD%\*.exe" "%CD%\Soleil" /y
xcopy64 "%CD%\*.conf" "%CD%\Soleil" /y
xcopy64 "%CD%\CLEAR_DATABASE.FDB" "%CD%\Soleil" /y
if exist "%CD%\DATABASE.FDB" xcopy "%CD%\DATABASE.FDB" "%CD%\Soleil" /y
xcopy64 "%CD%\firebird.msg" "%CD%\Soleil" /y
xcopy64 "%CD%\build.bat" "%CD%\Soleil" /y
xcopy64 "%CD%\build_cliente.bat" "%CD%\Soleil" /y
xcopy64 "%CD%\convert.bat" "%CD%\Soleil" /y
xcopy64 "%CD%\Soleil.png" "%CD%\Soleil" /y
cd Soleil
rar a -r Soleil.rar *.*
cd..
xcopy64 "%CD%\Soleil\Soleil.rar" "%CD%\" /y
) else (
xcopy32 "%CD%\*.dll" "%CD%\Soleil" /y
xcopy32 "%CD%\*.exe" "%CD%\Soleil" /y
xcopy32 "%CD%\*.conf" "%CD%\Soleil" /y
xcopy32 "%CD%\CLEAR_DATABASE.FDB" "%CD%\Soleil" /y
if exist "%CD%\DATABASE.FDB" xcopy "%CD%\DATABASE.FDB" "%CD%\Soleil" /y
xcopy32 "%CD%\firebird.msg" "%CD%\Soleil" /y
xcopy32 "%CD%\build.bat" "%CD%\Soleil" /y
xcopy32 "%CD%\build_cliente.bat" "%CD%\Soleil" /y
xcopy32 "%CD%\convert.bat" "%CD%\Soleil" /y
xcopy64 "%CD%\Soleil.png" "%CD%\Soleil" /y
cd Soleil
rar a -r Soleil.rar *.*
cd..
xcopy32 "%CD%\Soleil\Soleil.rar" "%CD%\" /y
)

ECHO %CD%