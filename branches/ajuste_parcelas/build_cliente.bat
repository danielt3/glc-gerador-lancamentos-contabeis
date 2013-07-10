@ECHO OFF
if not exist "%CD%\GLC" mkdir "%CD%\GLC"
del "%CD%\GLC\*.*" /f /s /q
xcopy "%CD%\*.dll" "%CD%\GLC" /y
xcopy "%CD%\*.exe" "%CD%\GLC" /y
xcopy "%CD%\*.conf" "%CD%\GLC" /y
xcopy "%CD%\CLEAR_DATABASE.FDB" "%CD%\GLC" /y
xcopy "%CD%\firebird.msg" "%CD%\GLC" /y
xcopy "%CD%\dados_cliente.txt" "%CD%\GLC" /y
xcopy "%CD%\Build.bat" "%CD%\GLC" /y
xcopy "%CD%\convert.bat" "%CD%\GLC" /y
cd GLC
del utils.dll
ren CLEAR_DATABASE.FDB DATABASE.FDB
rar a -r GLC.rar *.*
cd..
xcopy "%CD%\GLC\GLC.rar" "%CD%\" /y
cls
ECHO **************************************************************************
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                Arquivo do GLC gerado com sucesso em                ***
ECHO ***                             GLC.rar!                               ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO ***                                                                    ***
ECHO **************************************************************************
pause