#!/bin/bash

cd /usr/src/app

# change python environment
source activate emission

# run cronjob
PYTHONPATH=. /opt/conda/envs/emission/bin/python bin/intake_multiprocess.py 3 >> /var/log/emission/intake.stdinout 2>&1
