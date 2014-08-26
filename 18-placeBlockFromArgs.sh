#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'
. 'mcpi/block.sh'


    
if [ $# -eq 1 ];
then

    #First thing to do is create a connection to the Minecraft world
    connection_create
    IFS=", " read -a block <<< $1
    #Get coordinates as an array
    IFS=", " read -a pos <<< $( player_getTilePos )
    (( pos[0] = pos[0] + 1 ))
    (( pos[2] = pos[2] + 1 ))
    pos[1]=$( getHeight ${pos[0]} ${pos[2]})
elif [ $# -eq 2 ];
then
    #First thing to do is create a connection to the Minecraft world
    connection_create
    IFS=", " read -a block <<< $1
    IFS=", " read -a pos <<< $2
else
    echo "expected 1 or 2 arguments but got $#"
    echo "To place block next to player:"
    echo "Usage : bash script.sh blockId,blockData"
    echo "To place block at a specific coordinate"
    echo "Usage : bash script.sh blockId,blockData x,y,z"
    exit 0
fi



msg="Creating block at ( ${pos[0]}, ${pos[1]}, ${pos[2]})";

echo $msg

#postToChat "$msg"

setBlock  ${pos[0]} ${pos[1]} ${pos[2]} ${block[${BLOCK_ID}]} ${block[${BLOCK_DATA}]}




