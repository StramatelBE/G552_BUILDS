#!/bin/bash

SERVDIR=/etc/systemd/system
SCRIPTDIR=~/server_builds/scripts/services
ENABLE="sudo systemctl enable"
START="sudo systemctl start"
RELOAD="sudo systemctl daemon-reload"

echo "SERVICE INIT"
sudo cp $SCRIPTDIR/*.service $SERVDIR/
$RELOAD
echo "ENABLING SERVICES AT STARTUP"
$ENABLE backend.service
$START backend.service
$ENABLE frontend.service
$START frontend.service
$ENABLE display.service
$START display.service

