#!/bin/bash

SCRIPTDIR=~/server_builds/scripts/run
BUILDDIR=~/server_builds/builds

cp $SCRIPTDIR/startBackend.sh $BUILDDIR
cp $SCRIPTDIR/startFrontend.sh $BUILDDIR
cp $SCRIPTDIR/startDisplay.sh $BUILDDIR
