#!/bin/bash
# Monitor when Proxmox resizes disks on guest VMs. This script monitors Proxmox
# API logs and triggers the live-resize script on the guest VM

tail -fn0 /var/log/pve/tasks/index /var/log/pveproxy/access.log | \
while read line ; do
    API_REQUEST=$(echo "$line" | grep -Eo '/api2/\w+/nodes/\w+/qemu/[[:digit:]]+/resize')
    if [[ ! -z $API_REQUEST ]]; then
        # perform resizing commands
        VM_ID=$(echo "$API_REQUEST" | awk -F "/" '{ print $7 }')
        echo "[INFO] A disk on VM $VM_ID has been resized. Executing live resize..."

        qm guest exec $VM_ID -- live-resize
        if [[ $? -ne 0 ]]; then
            echo "[WARN] Live resize command failed to execute! Script most likely doesn't exist on host. Continuing..."
        fi
    fi
done
