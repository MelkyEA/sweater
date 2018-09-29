#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/sweater2.pem \
     target/sweater-1.0-SNAPSHOT.jar \
     ubuntu@3.120.104.158:/home/ubuntu/
echo 'Restart server...'

ssh -i ~/.ssh/sweater2.pem  ubuntu@3.120.104.158 <<EOF

pgrep java | kill -9
nohup java -jar sweater-1.0-SNAPSHOT.jar > log.txt &

EOF

echo 'Bye'