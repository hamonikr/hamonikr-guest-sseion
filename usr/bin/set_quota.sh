#!/bin/bash
#
# ref : http://souptonuts.sourceforge.net/quota_tutorial.html
# ref : https://www.linuxquestions.org/questions/linux-server-73/directory-quota-601140/
#
# create big file for testing
# dd if=/dev/zero of=./big.img bs=4k iflag=fullblock,count_bytes count=5G

GRP="sgbgroup"
QTSIZE="5" # quota limit 5GB 

# create virtual folder for quota
if [ ! -d "/var/tmp/virtual_disks" ]; then
    echo "create virtual folder for quota..."
    sudo mkdir /var/tmp/virtual_disks
    sudo touch /var/tmp/virtual_disks/directory_with_size_limit.ext4
    sudo dd if=/dev/zero of=/var/tmp/virtual_disks/directory_with_size_limit.ext4 bs=1G count=${QTSIZE}
    sudo mkfs.ext4 /var/tmp/virtual_disks/directory_with_size_limit.ext4
fi

# setting folder for guest session
if [ ! -d "/var/tmp/guest-data" ]; then
    echo "setting folder for guest session..."
    sudo mkdir -m 0777 /var/tmp/guest-data
    sudo groupadd ${GRP}
    sudo chgrp ${GRP} /var/tmp/guest-data
    sudo chmod 0777 /var/tmp/guest-data
    sudo chmod 2775 /var/tmp/guest-data

    sudo quotacheck -cug /var/tmp/guest-data    
fi

# update /etc/fstab
sudo sed -i '/directory_with_size_limit.ext4/d' /etc/fstab
echo "/var/tmp/virtual_disks/directory_with_size_limit.ext4    /var/tmp/guest-data ext4    rw,loop,usrquota,grpquota  0 0" | sudo tee -a /etc/fstab >/dev/null 2>&1 || true

echo "Finished quota settings. You must be Reboot system !"