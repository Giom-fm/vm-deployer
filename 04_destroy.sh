#!/bin/bash

VM_ID=$1

qm stop $VM_ID && qm destroy $VM_ID -purge true