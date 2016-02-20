#!/bin/bash

sudo apt-get update
sudo apt-get install ruby-dev -y
sudo ufw disable

#sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
#sudo \curl -sSL https://get.rvm.io | bash -s stable --ruby
#source ~/.rvm/scripts/rvm
#rvm use 2.2.1
#sudo chmod 777 -R /usr/local/rvm
#gem install bundler
#
#cd /srv/site
#bundle install
