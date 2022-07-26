#!/bin/bash
# Remove if previous deployment folder exists
sudo rm -rf /var/www/autobuffy-be/prev-deployment
# Backup current deployment
sudo mv /var/www/autobuffy-be/deployment /var/www/autobuffy-be/prev-deployment
# #Create new deployment folder and make nginx owner
sudo mkdir /var/www/autobuffy-be/deployment