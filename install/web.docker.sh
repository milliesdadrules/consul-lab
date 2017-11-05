#!/usr/bin/env bash

# Create an html page with the ip of this node
ipAddr=$(ifconfig eth1 | grep 'inet addr' | awk '{ print substr($2,6) }')
echo "<h1>$(hostname) - $ipAddr </h1>" > /home/vagrant/home.html

# Run nginx via docker
docker run -d \
           --name web \
           -p 8090:80 \
           --restart unless-stopped \
           -v /home/vagrant/home.html:/usr/share/nginx/html/home.html:ro \
           nginx