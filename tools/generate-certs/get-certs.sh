#!/bin/bash

cat <<EOF > .pyrax
[rackspace_cloud]
username = $USERNAME
api_key = $API_KEY
EOF

echo $DOMAINS > domains.txt
./dehydrated --register --accept-terms  --challenge dns-01  --hook hooks/rackspace/hook.py
./dehydrated --challenge dns-01 --cron --hook hooks/rackspace/hook.py
