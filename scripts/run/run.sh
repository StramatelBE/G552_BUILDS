#!/bin/bash

SCRIPTDIR=~/server_builds/scripts/run
BUILDDIR=~/server_builds/builds

cp $SCRIPTDIR/startBackend.sh $BUILDDIR/backend/
cp $SCRIPTDIR/startFrontend.sh $BUILDDIR/frontend/
cp $SCRIPTDIR/startDisplay.sh $BUILDDIR/display/
