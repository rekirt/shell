#!/bin/zsh
# zsh tcp server script
zmodload zsh/net/tcp
ztcp -l 5150
fd=$REPLY
echo "Waiting connected"

ztcp -a $fd
clientfd=$REPLY
echo "Client connected"

echo "Welcome to my server" >& $clientfd
while [1] do
  read line <& $clientfd
  if [[ $line = 'exit' ]] then
    break
  else
    echo Received:$line
    echo $line >& $clientfd
  fi
done
echo "Client disconnected session"
ztcp -c $fd
ztcp -c $clientfd



