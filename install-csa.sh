#!/bin/sh
sudo hostname 'csa.example.com'
echo "127.0.1.1 192.168.99.100 csa" | sudo tee -a /etc/hosts

sudo ufw allow 18444/tcp
sudo ufw allow 18089/tcp
sudo ufw allow 18445/tcp

	##################       docker-compose CSA               ###################

mkdir ~/csa
cd ~/.
curl -k -L https://github.com/HewlettPackard/csa-ce/raw/master/buildEnv-dockercompose.sh | bash /dev/stdin csaserver.example.com 192.168.99.100
echo " CSA Build completed at      :" >> /tmp/build
date >> /tmp/build
cat /tmp/build
echo
echo Starting CSA...
sleep 5m
echo
echo "Please note the below URLs for your reference"
echo "CSA Management Console - https://192.168.99.100:18444/csa"
echo "MPP - https://192.168.99.100:18089/mpp"
echo "Operations Orchestration Central - https://192.168.99.100:18445/oo"
