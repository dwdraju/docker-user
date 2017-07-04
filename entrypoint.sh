#!/bin/bash

set -u

# Create new group and user with provided ID and NAME if it does not exist
id -g 1000 > /dev/null 2>&1;
if [ $? = 1 ]; then
	echo "Create group with id: 1000"
	groupadd --gid $GROUP_ID $USERNAME
fi

id -u 1000 > /dev/null 2>&1;
if [ $? = 1 ]; then
	echo "Create user with id: $USER_ID and $USERNAME"
	useradd -m -d /home/$USERNAME -s /bin/bash -u $USER_ID -g $GROUP_ID $USERNAME
fi
tail -f /dev/null
exec su $USERNAME "$@"