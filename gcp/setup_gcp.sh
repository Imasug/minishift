#!/bin/bash

GCP_USER="developer"
GCP_HOST="35.225.24.114"

cd `dirname $0`
cat ./setup_minishift.sh | ssh "$GCP_USER@$GCP_HOST"

minishift start --vm-driver generic --remote-ipaddress $GCP_HOST --remote-ssh-user $GCP_USER --remote-ssh-key ~/.ssh/id_rsa
