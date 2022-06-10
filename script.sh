#!/bin/bash

sudo mkfs -t xfs /dev/xvdh
sudo mkdir /data
sudo mount /dev/xvdh /data