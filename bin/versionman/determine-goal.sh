#!/usr/bin/env bash

echo "THIS IS PYTHON 2!"
echo "Unfortunately, it won't work on this stack (Heroku-18) as-is. "
echo "Your options are to upgrade your app to Python, or use an older stack."
echo "Would you like to upgrade your app [U] or downgrade your stack [D]? Just hit enter to leave this doc."

read goal

if [ $goal != "" ]; then
    if [ $goal == "U" ]; then
        source bin/versionman/upgrade-python
    elif [ $goal == "D" ]; then
        source bin/versionman/upgrade-python
    else
        echo "Goodbye"
        exit 1
else
    echo "Goodbye"
    exit 1
fi
