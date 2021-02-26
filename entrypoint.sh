#!/bin/bash

password=`cat /config/password`
echo "root:$password" | chpasswd
mkdir -p /root/.ssh
cat /config/authorized_keys > /root/.ssh/authorized_keys
chmod 400 /root/.ssh/authorized_keys

exec "$@"
