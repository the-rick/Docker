#!/bin/sh
echo "Starting build..."
docker build -t ex01 .

echo "Build finished. Running..."
docker run -d --name teamspeak --rm -p 9987:9987/udp -p 10011:10011 -p 30033:30033 ex01
#docker run -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -e TS3SERVER_LICENSE=accept teamspeak

# echo "Server is running. $(docker-machine ip Char)."
# echo "Run \`docker stop teamspeak\`..........when finished"