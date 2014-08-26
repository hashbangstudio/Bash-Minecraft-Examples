#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'


#First thing to do is create a connection to the Minecraft world
connection_create

#Get coords as an array
IFS=", " read -a pos <<< $( player_getTilePos )
msg="You are at (${pos[0]}, ${pos[1]}, ${pos[2]})"

# Print to standard output (terminal probably)
echo $msg

#NOTE need to quote the variable so that does not evaluate the spaces as variable separators
#Send a command to the Minecraft world
postToChat "$msg"

#Generate random shift values
(( xShift = (($RANDOM % 21)) - 10 ))
(( zShift = (($RANDOM % 21)) - 10 ))

(( newXpos = ${pos[0]} + xShift ))
(( newZpos = ${pos[2]} + zShift ))
height=$(getHeight $newXpos $newZpos )

player_setTilePos $newXpos $height $newZpos


#Get coords as an array
IFS=", " read -a pos <<< $( player_getTilePos )
msg="You have been moved to (${pos[0]}, ${pos[1]}, ${pos[2]})"

# Print to standard output (terminal probably)
echo $msg

#NOTE need to quote the variable so that does not evaluate the spaces as variable separators
#Send a command to the Minecraft world
postToChat "$msg"


