#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'


if [ $# -eq 1 ]
then

    #First thing to do is create a connection to the Minecraft world
    connection_create

    # Print to standard output (terminal probably)
    echo $1

    #NOTE need to quote the variable so that does not evaluate the spaces as variable separators
    #Send a command to the Minecraft world
    postToChat "$1"
else
    echo "expected one argument but got $#"
    exit 0
fi
