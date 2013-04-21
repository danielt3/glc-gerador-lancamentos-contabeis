@cho off
if not exist "%CD%\GLC" mkdir "%CD%\GLC"
del "%CD%\GLC\*.*" /f /s /q

if defined ProgramFiles(x86) (
xcopy64 "%CD%\*.dll" "%CD%\GLC" /y
xcopy64 "%CD%\*.exe" "%CD%\GLC" /y
xcopy64 "%CD%\*.conf" "%CD%\GLC" /y
xcopy64 "%CD%\CLEAR_DATABASE.FDB" "%CD%\GLC" /y
if exist "%CD%\DATABASE.FDB" xcopy "%CD%\DATABASE.FDB" "%CD%\GLC" /y
xcopy64 "%CD%\firebird.msg" "%CD%\GLC" /y
xcopy64 "%CD%\build.bat" "%CD%\GLC" /y
xcopy64 "%CD%\build_cliente.bat" "%CD%\GLC" /y
xcopy64 "%CD%\convert.bat" "%CD%\GLC" /y
cd GLC
rar a -r GLC.rar *.*
cd..
xcopy64 "%CD%\GLC\GLC.rar" "%CD%\" /y
) else (
xcopy32 "%CD%\*.dll" "%CD%\GLC" /y
xcopy32 "%CD%\*.exe" "%CD%\GLC" /y
xcopy32 "%CD%\*.conf" "%CD%\GLC" /y
xcopy32 "%CD%\CLEAR_DATABASE.FDB" "%CD%\GLC" /y
if exist "%CD%\DATABASE.FDB" xcopy "%CD%\DATABASE.FDB" "%CD%\GLC" /y
xcopy32 "%CD%\firebird.msg" "%CD%\GLC" /y
xcopy32 "%CD%\build.bat" "%CD%\GLC" /y
xcopy32 "%CD%\build_cliente.bat" "%CD%\GLC" /y
xcopy32 "%CD%\convert.bat" "%CD%\GLC" /y
cd GLC
rar a -r GLC.rar *.*
cd..
xcopy32 "%CD%\GLC\GLC.rar" "%CD%\" /y
)

ECHO %CD%