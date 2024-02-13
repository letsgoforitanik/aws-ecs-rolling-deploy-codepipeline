#!/bin/bash

echo $USER >> /home/ubuntu/dump.txt
echo $PATH >> /home/ubuntu/dump.txt
pm2 restart all
