#!/bin/bash

VERSION=$(cat ~/server_builds/builds/selected_version)

cd ~/server_builds/builds/$VERSION/build/backend

npm start
