#!/bin/sh

YEL="\x1B[1;33m"
RST="\x1B[0m"

echo "Run the command docker build -t ft-rails:on-build -f ft-rails/Dockerfile . (y)"
read RESPONSE
if [ "$RESPONSE" = "y" ]
then
	docker build -t ft-rails:on-build -f ft-rails/Dockerfile .
fi
RESPONSE="n"

echo "Run the command docker build -t railsapp-img . (y)" 
read RESPONSE
if [ "$RESPONSE" = "y" ]
then
	docker build -t railsapp-img .
fi
RESPONSE="n"

echo "Run the command docker run -d --name railsapp -it --rm -p 3000:3000 railsapp-img (y)" 

read RESPONSE
if [ "$RESPONSE" = "y" ]
then
	docker run -d --name railsapp -it --rm -p 3000:3000 railsapp-img
fi
RESPONSE="n"

sleep 2
echo "Server is running. $(docker-machine ip Char):3000"

