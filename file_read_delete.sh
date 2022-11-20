#!/bin/sh
mkdir /incoming
mkdir /filestore
chmod -R 777 /incoming
chmod -R 777 /filestore

cd /incoming
while :
echo "loop started"
for f in *.txt; 
do 
	head -c 20 $f > "/filestore/new_$f";
	rm -rf /incoming/$f
done
echo "sleep started"
sleep 60
echo "sleep ended"
do 
echo "runs every 5 mins"
done
