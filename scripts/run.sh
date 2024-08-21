#!/bin/bash

proj_dir="./$1/build_unix/"
if [ ! -d "$proj_dir" ]; then
    echo "Project not configured yet. Config with \"./tb <project_folder>\""
    exit 1
fi
skip=false

if [ -n "$2" ]; then
    index=$2
    if [ "$2" == "y" ]; then
        index=0
    fi
    skip=true
fi

if ! $skip; then
    count=0
    echo "Available executables:"
    for f in "$proj_dir"*; do
        if [ ! -f "$f" ]; then
            continue
        fi
        if [[ "$(basename "$f")" == "Makefile" || "$(basename "$f")" == *.* ]]; then
            continue
        fi
        echo "    $count - $(basename "$f")"
        count=$((count + 1))
    done
    echo
    read -p "Enter the number of the file you want to execute: " index
fi

count=0
for f in "$proj_dir"*; do
    if [ ! -f "$f" ]; then
        continue
    fi
    if [[ "$(basename "$f")" == "Makefile" || "$(basename "$f")" == *.* ]]; then
        continue
    fi
    if [ $count -eq $index ]; then
        echo "> $proj_dir$(basename "$f")"
        echo
        "$proj_dir$(basename "$f")"
        break
    fi
    count=$((count + 1))
done
