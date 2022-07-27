#!/bin/bash
# Load environment variables
source /etc/profile
# Print deployment info
DEPLOYMENT_TIME=$( date -u "+%Y/%m/%d %H:%M:%S" )
echo "Deployment finished at: "$DEPLOYMENT_TIME" UTC" > /var/www/autobuffy-be/deployment/public/deployment_time.txt
# Arrange folder permissions
chown -R ubuntu:ubuntu /var/www/autobuffy-be/deployment
chmod -R 775 /var/www/autobuffy-be/deployment
sudo service nginx restart
bundle install