#!/bin/bash

# Required if you plan to start SSH
echo "root:linux" | chpasswd
mkdir -p /var/run/sshd
service ssh start
# Sets the user and password with admin permissions
MYUSER=ubuntu
MYPASS=ubuntu
id -u $MYUSER &>/dev/null || useradd --create-home --shell /bin/bash --user-group --groups users $MYUSER
echo "$MYUSER:$MYPASS" | chpasswd

# Supervisor keeps X and x11vnc running
exec /usr/bin/supervisord -n
