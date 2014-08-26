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

#Set the wallStartPosn
(( wallStartXpos = ${pos[0]} + 6 ))
(( wallStartYpos = ${pos[1]} + 1 ))
(( wallZpos = ${pos[2]} + 6 ))
(( wallEndXpos = $wallStartXpos + 10 ))
(( wallEndYpos = $wallStartYpos + 6 ))

setBlocks $wallStartXpos $wallStartYpos $wallZpos $wallEndXpos $wallEndYpos $wallZpos ${DIAMOND_BLOCK[$BLOCK_ID]}

