#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'


if [ $# -eq 1 ]
then

    #First thing to do is create a connection to the Minecraft world
    connection_create
    echo $1
    while read input
    do
      echo $input
      postToChat "$input"
    done < $1
 
else
    echo "expected one argument but got $#"
    exit 0
fi
