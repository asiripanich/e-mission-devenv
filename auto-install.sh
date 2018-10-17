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

# Setup & run gateway
# ./e-mission-gateway/setup.sh

# Setup & run server
cd e-mission-server
./setup.sh
cd ..

# Setup & run phone locally
cd e-mission-phone
./setup.sh