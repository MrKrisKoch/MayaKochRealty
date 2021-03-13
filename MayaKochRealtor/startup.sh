#!/bin/bash
DLL=$1
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out localhost.crt -subj "/C=US/ST=ID/L=BOI/O=KRISKOCH/OU=FREELANCE/CN=MAYAKOCHREALTY/emailAddress=mrkriskoch@gmail.com"
service nginx start

dotnet /app/$DLL > /dev/null &

#keep the container alive even if the last process dies
while [ true ]
do
    sleep 3600
done