@echo off


echo %1 | findstr /C:"h" >nul
set /a "help = %errorlevel%"
echo %1 | findstr /C:"help" >nul
set /a "help = %help% & %errorlevel%"
if %help% equ 0 (
    echo Commands:
    echo    c ^<project_name^>  Configures the project.
    echo    b ^<project_name^>  Builds the project.
    echo    r ^<project_name^>  Runs the project.
    echo    clean             Remove all build/configure output folders.
    echo    help,h            Shows this.
    echo
    echo Can stack commands like: "./tb cb <project_name>"
    echo
    exit
)

echo %1 | findstr /C:"clean" >nul
if %errorlevel% equ 0 (
    echo Cleaning...
    call ./scripts/clean.bat
    exit
)

REM CHECK IF HAS SECOND ARGUMENT
if "%~2"=="" (
    echo The second argument is missing.
    exit
)
if not exist "%2\" (
    echo The project does not exist.
    exit
)

REM COMMANDS MAPPING
echo %1 | findstr /C:"c" >nul
if %errorlevel% equ 0 (
    echo Configuring...
    call ./scripts/config.bat %2
    if %errorlevel% neq 0 (
        echo Error when configuring! Aborting!
        exit
    )
)

echo %1 | findstr /C:"b" >nul
if %errorlevel% equ 0 (
    echo Building...
    call ./scripts/build.bat %2
    if %errorlevel% neq 0 (
        echo Error when building! Aborting!
        exit
    )
)

echo %1 | findstr /C:"r" >nul
if %errorlevel% equ 0 (
    echo Running...
    if "%~3"=="" (
        call ./scripts/run.bat %2
    ) else (
        call ./scripts/run.bat %2 %3
    )
    if %errorlevel% neq 0 (
        echo Error when run! Aborting!
        exit
    )
)