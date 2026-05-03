#!/bin/bash

#1. Create virtual disk
#2. lsblk
#3. input - disk name from lsblk
#4. check if any file system does not exist
#5. if file system exist -> 7
#6. if not -> format disk with fs
#7. mount file system to the folder
#8. add disk to fstab

#crash script if has-error. If exitcode = 1, code will be finished
set -e

DISK_NAME=$1
MOUNT_POINT="/mnt/mount_disk_task"
FS_TYPE="ext4"

function validate_user_input(){
    if [[ ! "$EUID" -eq 0 ]]; then
        echo "Doesn't have root permissiins"
        exit 1
    fi

    if [[ -z $DISK_NAME ]]; then
        echo "Please put disk name as positional parametr."
        exit 1
    fi
}

function validate_disk_and_fs_exists() {
    set +e
    ls $DISK_NAME
    IS_DISK_EXIST=$?

    if [[ $IS_DISK_EXIST -eq 0 ]]; then
        echo "Disk name found: $DISK_NAME"
    else 
        echo "Disk name not found: $DISK_NAME"
        exit 1
    fi

    blkid $DISK_NAME | grep $FS_TYPE
    IS_EXT4=$?

    set -e

    if [[ $IS_EXT4 -eq 0 ]]; then
        echo -e "File system $FS_TYPE exist on the disk.\nSkip fs creation"
    else
        echo -e "File system $FS_TYPE not exist on the disk.\nFs creation"
        yes | mkfs.ext4 $DISK_NAME
        echo "Filesystem has been successfully created"
    fi
}|


function create_mount_point_and_mount_disk (){
        #create mouning point
    echo "Creating empty mount point, if not created : $MOUNT_POINT"
    mkdir -p $MOUNT_POINT

    echo "Mounting disk $DISK_NAME to mount point $MOUNT_POINT..."
    mount $DISK_NAME $MOUNT_POINT
    echo "Disk $DISK_NAME has been mounted successfully to $MOUNT_POINT..."

    echo "Processing fstab..."
    echo "$DISK_NAME $MOUNT_PIONT $FS_TYPE  defaults 0 2" >> /etc/fstab
    echo "fstab has been processed"    
}

function main(){
    validate_user_input
    validate_disk_and_fs_exists
    create_mount_point_and_mount_disk
}
main
