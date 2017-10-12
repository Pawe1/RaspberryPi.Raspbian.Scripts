#!/bin/bash
lsusb

# Informations about device: lsusb -s 001:005 -v
# Getting camera resolution: lsusb -s 001:005 -v | egrep "Width|Height"