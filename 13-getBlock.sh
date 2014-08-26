#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'
. 'mcpi/block.sh'
. 'mcpi/blockData.sh'

#First thing to do is create a connection to the Minecraft world
connection_create

#Get coordinates as an array
IFS=", " read -a pos <<< $( player_getTilePos )
height=$( getHeight ${pos[0]} ${pos[2]} )

msg="Height is "$height

# Print to standard output (terminal probably)
echo $msg

#NOTE need to quote the variable so that does not evaluate the spaces as variable separators
#Send a command to the Minecraft world
postToChat "$msg"


blockIdNum=$(getBlock ${pos[0]} $height ${pos[2]})

if [ $blockIdNum -eq ${AIR[${BLOCK_ID}]} ]
then
     (( lowerHeight = $height - 1 ))
     # Need to do height minus one for this as not flower etc
     blockIdNum=$( getBlock ${pos[0]} $lowerHeight ${pos[2]} )
fi

blockName=$(BlockData_getBlockNameFromId $blockIdNum )

# Add to message, the type of block stood on
msg="Block is of type $blockIdNum which is $blockName"

# Print to standard output (terminal probably)
echo $msg

#NOTE need to quote the variable so that does not evaluate the spaces as variable separators
#Send a command to the Minecraft world
postToChat "$msg"

