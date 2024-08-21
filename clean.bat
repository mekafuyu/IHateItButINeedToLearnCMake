@echo off
REM Remove all 'build' directories
for /d /r %%d in (build*) do if exist "%%d" rmdir /s /q "%%d"

REM Remove all 'out' directories
for /d /r %%d in (out) do if exist "%%d" rmdir /s /q "%%d"

REM Remove all '.vs' directories
for /d /r %%d in (.vs) do if exist "%%d" rmdir /s /q "%%d"
