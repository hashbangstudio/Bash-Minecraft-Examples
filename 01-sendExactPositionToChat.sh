#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'

#First thing to do is create a connection to the Minecraft world
connection_create

pos=$( player_getPos )

#TODO Convert the array of float values to 1 decimal place for printing
msg="You are at (${pos})"
# Print to standard output (terminal probably)
echo $msg

#NOTE need to quote the variable so that does not evaluate the spaces as variable separators
#Send a command to the Minecraft world
postToChat "$msg"
