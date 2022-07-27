#!/bin/bash
export PATH=/home/ubuntu/.rvm/gems/ruby-2.5.0/bin:/home/ubuntu/.rvm/gems/ruby-2.5.0@global/bin:/home/ubuntu/.rvm/rubies/ruby-2.5.0/bin:/home/ubuntu/bin:/home/ubuntu/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/ubuntu/.rvm/bin:/home/ubuntu/.rvm/bin
sudo kill -9 $(cat /var/www/my-app/tmp/pids/server.pid)
cd /var/www/my-app/
#sudo apt-get install ruby2.3-dev libffi-dev -y
gem install nokogiri — — use-system-libraries
bundle config build.nokogiri — use-system-libraries
gem install bundler — user-install
# gem install libv8 -v 3.11.8.17 -- --with-system-v8
bundle install
cd /home/ec2-user/server/v1

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
# get current region
REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')
declare -a array=("ABC")
for i in "${array[@]}"
do
    declare $i=$(aws ec2 describe-tags --filters "Name=resource-id,Values=$INSTANCE_ID" "Name=key,Values=$i" --region=$REGION --output=text | cut -f5)
    echo $i
    export $i
done