#!/bin/bash

# run cronjobs
cron

# change python environment
source activate emission

# launch the webapp
./e-mission-py.bash emission/net/api/cfc_webapp.py

# inject test data into mongodb
# ./e-mission-py.bash bin/debug/load_timeline_for_day_and_user.py emission/tests/data/real_examples/shankari_2015-07-22 test_july_22
# ./e-mission-py.bash bin/debug/intake_single_user.py -e test_july_22
