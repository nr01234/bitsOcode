@echo off

for /f "delims=" %%i in ('CSCRIPT yesterday.vbs') do set d=%%i
set mm=%d:~0,2%
set dd=%d:~3,2%
set yyyy=%d:~6,4%
echo %d%
echo %mm%
echo %dd%
echo %yyyy%
pause