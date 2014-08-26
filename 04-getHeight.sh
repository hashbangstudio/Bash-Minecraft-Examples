#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'

    
if [ $# -eq 0 ];
then

    #First thing to do is create a connection to the Minecraft world
    connection_create
    
    #Get coordinates as an array
    IFS=", " read -a pos <<< $( player_getTilePos )
    
    msg="Height is "$( getHeight ${pos[0]} ${pos[2]} )

    # Print to standard output (terminal probably)
    echo $msg

    #NOTE need to quote the variable so that does not evaluate the spaces as variable separators
    #Send a command to the Minecraft world
    postToChat "$msg"

elif [ $# -eq 2 ];
then

    #First thing to do is create a connection to the Minecraft world
    connection_create

    msg="Height is "$( getHeight $1 $2 )

    # Print to standard output (terminal probably)
    echo $msg

    #NOTE need to quote the variable so that does not evaluate the spaces as variable separators
    #Send a command to the Minecraft world
    postToChat "$msg"

else
    echo "expected 0 or 2 arguments but got $#"
    exit 0
fi
