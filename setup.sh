#!/bin/bash

# Setup network
./e-mission-database/dk_create_network.sh

# Setup & run mongoDB
./e-mission-database/dk_mongoDB_run.sh

# Setup & run gateway
# ./e-mission-gateway/setup.sh

# Setup & run server
cd e-mission-server
./setup.sh
cd ..

# Setup & run phone locally
cd e-mission-phone
./setup.sh