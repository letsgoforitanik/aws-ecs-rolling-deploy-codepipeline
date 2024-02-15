#!/bin/bash

pm2 delete all
pm2 start /home/ubuntu/app/dist/index.js
