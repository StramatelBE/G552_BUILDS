#!/bin/bash

export PATH="/home/stramatel/.nvm/versions/node/v20.11.1/bin:$PATH"

VERSION=$(cat ~/server_builds/builds/selected_version)

cd ~/server_builds/builds/$VERSION/build/display

npm start