#!/bin/bash

if [[ "$RUN_TOOLS" == "true" ]]; then
    echo "Running black and pyupgrade..."
    black "$@"
#    pyupgrade "$@"
else
    echo "Skipping black and pyupgrade..."
    exit 0
fi
