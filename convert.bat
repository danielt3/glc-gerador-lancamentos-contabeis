@ECHO OFF
IF EXIST "utf16.txt" DEL "utf16.txt"
WIN_ICONV -f iso-8859-1 -t UTF-16 %1 >> "utf16.txt"
IF EXIST %2 DEL %2
WIN_ICONV -f UTF-16BE -t UTF-8 "utf16.txt" >> %2
IF EXIST "utf16.txt" DEL "utf16.txt"