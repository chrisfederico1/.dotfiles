#!/bin/bash

# Server to ping
SERVER="8.8.8.8"

# Log file
LOGFILE="connectivity.log"

# Interval between checks (in seconds)
INTERVAL=5

echo "Starting connectivity monitor. Logging to $LOGFILE..."
echo "----------------------------------------" >> $LOGFILE
echo "$(date): Monitoring started for $SERVER" >> $LOGFILE

while true; do
    # Rotate logs if ile size exceeds 1 MB
    if [ $(stat --printf="%s" $LOGFILE) -gt 1048576 ]; then
        mv $LOGFILE "${LOGFILE}_$(date +%Y%m%d%H%M%S)"
        echo "$(date): Log file rotated" > $LOGFILE
    fi
    
    # Ping the server
    if ! ping -c 1 -W 2 $SERVER > /dev/null 2>&1; then
        echo "$(date): Internet connection lost to $SERVER" >> $LOGFILE
    else
        echo "$(date): Connection to $SERVER is active" >> $LOGFILE
    fi
    sleep $INTERVAL
done

