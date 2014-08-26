#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'
. 'mcpi/block.sh'


#First thing to do is create a connection to the Minecraft world
connection_create

#Get coords as an array
IFS=", " read -a pos <<< $( player_getTilePos )


(( blockXpos = ${pos[0]} + 1 ))
(( blockYpos = ${pos[1]} + 1 ))
(( blockZpos = ${pos[2]} + 1 ))

msg="Creating block at ($blockXpos, $blockYpos, $blockZpos)";

echo $msg

setBlock $blockXpos $blockYpos $blockZpos ${DIAMOND_BLOCK[${BLOCK_ID}]}


