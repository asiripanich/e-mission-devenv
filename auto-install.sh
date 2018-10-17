#!/bin/bash

#
# Prerequisites
#
./prerequisites.sh

#
# Build images
#
./build.phone.sh
./build.server.sh

#
# Prepare network
#
./init.network.sh

#
# Run dependencies
#
./run.mongo.sh

#
# Run app
#
./run.server.sh
./run.phone.sh

# Setup & run gateway
# ./e-mission-gateway/setup.sh