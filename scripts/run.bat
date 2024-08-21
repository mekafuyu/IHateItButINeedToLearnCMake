@echo off

set "proj_dir=.\%1\build_win\"
if not exist %proj_dir% (
    echo Project not configured yet. Config with ".\tb <project_folder>"
    exit
)

if not "%~2"=="" (
    set "index=%2"
    if "%~2"=="y" (
        set index=0
    )
    goto :runfirst
)
set /a count=0
:: List every .exe file in the specified folder with numbering
echo Available executables:
for %%f in ("%proj_dir%*.exe") do (
    echo     %count% - %%~nxf
    set /a count+=1
)
echo.
set /p index="Enter the number of the file you want to execute: "

:runfirst
set /a count=0
for %%f in ("%proj_dir%*.exe") do (
    if %count% equ %index% (
        echo ^> %proj_dir%%%~nxf
        echo.
        %proj_dir%%%~nxf
    )
    set /a count+=1
)
