if not exist "%CD%\GLC" mkdir "%CD%\GLC"
del "%CD%\GLC\*.*" /f /s /q
xcopy "%CD%\*.dll" "%CD%\GLC" /y
xcopy "%CD%\*.exe" "%CD%\GLC" /y
xcopy "%CD%\*.conf" "%CD%\GLC" /y
xcopy "%CD%\CLEAR_DATABASE.FDB" "%CD%\GLC" /y
if exist "%CD%\DATABASE.FDB" xcopy "%CD%\DATABASE.FDB" "%CD%\GLC" /y
xcopy "%CD%\firebird.msg" "%CD%\GLC" /y
xcopy "%CD%\build.bat" "%CD%\GLC" /y
xcopy "%CD%\build_cliente.bat" "%CD%\GLC" /y
xcopy "%CD%\convert.bat" "%CD%\GLC" /y
cd GLC
rar a -r GLC.rar *.*
cd..
xcopy "%CD%\GLC\GLC.rar" "%CD%\" /y