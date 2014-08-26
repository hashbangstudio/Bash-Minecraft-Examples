#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'
. 'mcpi/block.sh'



function sendToChatAndConsole(){
    # print to the standard output (terminal probably
    echo $1
    # send message to the minecraft chat
    postToChat "$1"
}


#First thing to do is create a connection to the Minecraft world
connection_create

sendToChatAndConsole "Saving Checkpoint"
#Save a checkpoint for the world state
saveCheckpoint

#wait for 2 seconds 
sleep 2
sendToChatAndConsole "Building Wall"

#Get coords as an array
IFS=", " read -a pos <<< $( player_getTilePos )


#Set the wallStartPosn
(( wallStartXpos = ${pos[0]} + 6 ))
(( wallStartYpos = ${pos[1]} + 1 ))
(( wallZpos = ${pos[2]} + 6 ))
(( wallEndXpos = $wallStartXpos + 10 ))
(( wallEndYpos = $wallStartYpos + 6 ))

setBlocks $wallStartXpos $wallStartYpos $wallZpos $wallEndXpos $wallEndYpos $wallZpos ${DIAMOND_BLOCK[$BLOCK_ID]}

#wait for 4 seconds 
sleep 4

sendToChatAndConsole "Restoring Checkpoint"
# Set the world back to the state it was in at the last saved checkpoint
restoreCheckpoint
sendToChatAndConsole "Making World unbreakable"
setting 'world_immutable' 1
#wait for 8 seconds 
sleep 8
sendToChatAndConsole "Making World breakable"
setting 'world_immutable' 0
#wait for 4 seconds 
sleep 4
#Follow the player
sendToChatAndConsole "Set Camera to follow the player"
camera_setFollow
#wait for 4 seconds 
sleep 4
sendToChatAndConsole "Making nametags visible"
setting 'nametags_visible' 1
#wait for 6 seconds 
sleep 6
sendToChatAndConsole "Making nametags invisible"
setting 'nametags_visible' 0
#wait for 4 seconds 
sleep 4
sendToChatAndConsole "Set Camera to normal player first person"
camera_setNormal

#wait for 2 seconds 
sleep 2
sendToChatAndConsole "Turning off AutoJump"
player_setting 'autojump' 0

#wait for 8 seconds 
sleep 8
sendToChatAndConsole "Turning on AutoJump"
player_setting 'autojump' 1



