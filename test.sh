#!/bin/bash -e

echo "============ docker info ============"
sudo docker info
echo "============ list of docker containers ============"
sudo docker ps 
# sudo docker rm -f cron
echo "============ checking nexec container is up ============"
sudo docker ps | grep nexec
echo "============ checking cron container is up============"
sudo docker ps | grep cron
echo "============ checking steptrigger containeris up ============"
sudo docker ps | grep steptrigger
echo "============ checking runtrigger container is up ============"
sudo docker ps | grep runtrigger
echo "============ checking pipelinesync container is up ============"
sudo docker ps | grep pipelinesync
echo "============ checking www container is up ============"
sudo docker ps | grep www
echo "============ checking api container is up ============"
sudo docker ps | grep api
echo "============ checking api response ============"
curl localhost:30000
echo ""
echo "============ checking www response ============"
curl localhost:30001
