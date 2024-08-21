@echo off

if not exist ".\%1\build_win\" (
    echo Project not configured yet. Config with ".\tb <project_folder>"
    exit
)

cd ".\%1\build_win"
mingw32-make
cd "..\.."