#!/bin/bash

LOCK_FILE="$HOME/.config/BraveSoftware/Brave-Browser/SingletonLock"

if [ -f "$LOCK_FILE" ]; then
	
    rm -f "$LOCK_FILE"
	
    if [ ! -f "$LOCK_FILE" ]; then
        echo "SingletonLock file has been deleted successfully."
    
    else
        echo "Error occurred. SingletonLock file could not be deleted."
    fi

else
    echo "SingletonLock file does not exist."
fi
