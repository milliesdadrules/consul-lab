#!/usr/bin/env bash

# copy lb config file

cp /vagrant/config/lb/default /home/vagrant/default

# Run nginx via docker
docker run -d \
           --name lb\
           -p 8090:80 \
           --restart unless-stopped \
           -v /home/vagrant/default:/usr/share/nginx/sites-available/default:ro \
           nginx