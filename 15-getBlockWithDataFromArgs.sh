#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'
. 'mcpi/block.sh'
. 'mcpi/blockData.sh'

#First thing to do is create a connection to the Minecraft world
connection_create

if [ $# -eq 2 ];
then

    height=$( getHeight $1 $2 )
    #Get the block that would be stood on at this Horiz posn
    (( height = height - 1 ))
    pos[0]=$1
    pos[1]=$height
    pos[2]=$2

elif [ $# -eq 3 ];
then
    pos[0]=$1
    pos[1]=$2
    pos[2]=$3
    
else
    echo "Expected 2 or 3 arguments but got $#"
    echo "Usage with 3 args: bash script.sh xcoord ycoord zcoord"
    echo "Usage with 2 args: bash script.sh xcoord zcoord"
    exit 0
fi


#NOTE with getBlockWithData it seems to need to do this in two stages
blockText=$(getBlockWithData ${pos[0]} ${pos[1]} ${pos[2]})
IFS=", " read -a blockIdAndData <<< $blockText

blockName=$(BlockData_getBlockNameFromId ${blockIdAndData[${BLOCK_ID}]} )

# Add to message, the type of block stood on
msg="Block is of type ${blockIdAndData[${BLOCK_ID}]} which is $blockName"

# Print to standard output (terminal probably)
echo $msg

#NOTE need to quote the variable so that does not evaluate the spaces as variable separators
#Send a command to the Minecraft world
postToChat "$msg" 

#Print block data info
msg="Block Data: ${blockIdAndData[${BLOCK_ID}]}"
# Print to standard output (terminal probably)
echo $msg

#NOTE need to quote the variable so that does not evaluate the spaces as variable separators
#Send a command to the Minecraft world
postToChat "$msg"

#TODO get the wool colour if possible

