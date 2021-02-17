#!/bin/bash


NAME=$1
TEMPLATE_ID=$2
VM_ID=$3
CONFIG=$4

cp ./config/*  /var/lib/vz/snippets/

qm clone $TEMPLATE_ID $VM_ID --name $1
qm resize $VM_ID scsi0 +8G
qm set $VM_ID --cicustom  "user=local:snippets/config-$4.yml,network=local:snippets/network-$4.yml"
#qm set $VM_ID --ipconfig0 ip=192.168.120.3/24,gw=192.168.120.1
qm set $VM_ID --agent 1

qm start $VM_ID

