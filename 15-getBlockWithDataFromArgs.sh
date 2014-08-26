#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'
. 'mcpi/block.sh'
. 'mcpi/blockData.sh'

    
if [ $# -eq 2 ];
then

    height=$( getHeight $1 $2 )
    pos[0]=$1
    pos[1]=$height
    pos[2]=$2

elif [ $# -eq 3 ];
then
    pos[0]=$1
    pos[1]=$2
    pos[2]=$3
    
else
    echo "expected 2 or 3 arguments but got $#"
    exit 0
fi

#First thing to do is create a connection to the Minecraft world
connection_create


#NOTE with getBlockWithData it seems need to do this in two stages
blockText=$(getBlockWithData ${pos[0]} ${pos[1]} ${pos[2]})
IFS=", " read -a blockIdAndData <<< $blockText

echo "${blockIdAndData[${BLOCK_ID}]}, ${blockIdAndData[${BLOCK_DATA}]}"
if [[ ${blockIdAndData[${BLOCK_ID}]} -eq ${AIR[${BLOCK_ID}]} ]]
then
     (( pos[1] = pos[1] - 1 ))
     # Need to do height minus one for this as not flower etc
     blockText=$( getBlockWithData ${pos[0]} ${pos[1]} ${pos[2]} )
     IFS=", " read -a blockIdAndData <<< $blockText
fi

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

