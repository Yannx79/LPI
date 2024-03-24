#!/bin/bash

# By: Yannick Funes
# Datetime: 23/03/2023
# YT: https://youtu.be/gA3N9CrPvSE

title="107.1 Manage User and Group"
description="107.1 Manage user and group accounts and related system files with them."
machine=$(who am i | sed "s/^\(.*\)(\(.*\))\(.*\)/\2/" | sed "s/ //g")
date=$(date +%d/%m/%Y)
hour=$(date +%H:%M:%S)
server=$(logname)
user_names=("jenrique" "mhernando" "isoria")

echo "=============================================================="
echo "Title         : $title"
# echo "Description   : $description"
echo "Machine       : $machine"
echo "Server        : $server"
echo "Date          : $date"
echo "Hour          : $hour"
echo "=============================================================="

pause_execution

display_section_header() {
    echo
    echo "=============================================================="
    echo "$1"
    echo "=============================================================="
    echo
}

# Function to pause execution until user input
pause_execution() {
    read -p "Press any key to continue ..."
}

# Adding user account

display_section_header "Adding user account"

useradd -c "Juan E. User Account" -s /bin/bash -e 2024-03-30 -f 10 -p jenrique jenrique
useradd -c "Maria H. User Account" -s /bin/bash -e 2024-04-20 -f 15 -p mhernando mhernando
useradd -c "Ian S. User Account" -s /bin/bash -e 2024-05-14 -f 30 -p isoria isoria

id jenrique
id mhernando
id isoria

pause_execution

# Modifying user accounts

display_section_header "Modifying user accounts"

usermod -e "2025-01-15" -f 45 jenrique
usermod -e "2024-04-30" -f 30 mhernando
usermod -e "2025-01-01" -f 15 isoria

for user_name in "${user_names[@]}"; do
    passwd -S "$user_name"
done

pause_execution

# Deleting user accounts

display_section_header "Deleting user accounts"

userdel -r jenrique
userdel -r mhernando
userdel -r isoria

pause_execution

# The skel directory

display_section_header "The skel directory"

ls -la /etc/skel

pause_execution

# The /etc/login.defs file

display_section_header "The /etc/login.defs file"

cat /etc/login.defs | tail -n 10

pause_execution

# The passwd command

display_section_header "The passwd command"

useradd -c "Juan E. User Account" -s /bin/bash -e 2024-03-30 -f 10 -p jenrique jenrique
useradd -c "Maria H. User Account" -s /bin/bash -e 2024-04-20 -f 15 -p mhernando mhernando
useradd -c "Ian S. User Account" -s /bin/bash -e 2024-05-14 -f 30 -p isoria isoria

passwd -l isoria
passwd -u isoria
passwd -e isoria # Force the user account to change the password.
passwd -n 15 -x 999 isoria

for user_name in "${user_names[@]}"; do
    passwd -S "$user_name"
done

pause_execution

# The passwd command

display_section_header "The chage command"

useradd -c "Juan E. User Account" -s /bin/bash -e 2024-03-30 -f 10 -p jenrique jenrique
useradd -c "Maria H. User Account" -s /bin/bash -e 2024-04-20 -f 15 -p mhernando mhernando
useradd -c "Ian S. User Account" -s /bin/bash -e 2024-05-14 -f 30 -p isoria isoria

for user_name in "${user_names[@]}"; do
    echo
    echo "User: $user_name"
    chage -l "$user_name"
done

pause_execution

# The /etc/passwd

display_section_header "/etc/passwd"

cat /etc/passwd | sed 's/:.*//' | awk '{print $1}' | tail -n 10

pause_execution

# The /etc/group

display_section_header "The /etc/group"

cat /etc/group | sed 's/:.*//' | awk '{print $1}' | tail -n 10

pause_execution

# The /etc/shadow

display_section_header "The /etc/shadow"

cat /etc/shadow | tail -n 10

pause_execution

# The /etc/gshadow

display_section_header "The /etc/gshadow"

cat /etc/gshadow | tail -n 10

pause_execution

# Post task

userdel -r jenrique
userdel -r mhernando
userdel -r isoria
