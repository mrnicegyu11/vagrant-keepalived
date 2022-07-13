#!/bin/bash
#/usr/bin/logger "RUN keepalived_vrrp_script"
if [ ! -f /keepalived.machine.online ];
then
    #DEBUG PRINT:
    #/usr/bin/logger "RUN keepalived_vrrp_script: /keepalived.machine.online: File not found"
    #
    # PROVOKE TIMEOUT AND RETURN NON-ZERO AFTERWARDS
    echo "/keepalived.machine.online: File not found" && sleep 10 && exit 1
else
    #DEBUG PRINT:
    #/usr/bin/logger "RUN keepalived_vrrp_script: /keepalived.machine.online: File found"
    echo "/keepalived.machine.online: File found" && exit 0
fi
