#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'


#First thing to do is create a connection to the Minecraft world
connection_create

read -p "Please Type a message to send to chat : " input
# Print to standard output (terminal probably)
echo $input

#NOTE need to quote the variable so that does not evaluate the spaces as variable separators
#Send a command to the Minecraft world
postToChat "$input"

