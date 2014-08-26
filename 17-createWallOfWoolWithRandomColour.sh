#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'
. 'mcpi/block.sh'


function getRandomColouredWoolBlock(){
    
    #Generate random shift values
    (( blockColour = (($RANDOM % 16)) ))
    echo ${WOOL[$BLOCK_ID]} $blockColour
}

#First thing to do is create a connection to the Minecraft world
connection_create

#Get coords as an array
IFS=", " read -a pos <<< $( player_getTilePos )


(( blockXpos = ${pos[0]} + 6 ))
(( blockYpos = ${pos[1]} + 1 ))
(( blockZpos = ${pos[2]} + 6 ))

firstColumnX=$blockXpos

for (( row = 1 ; row <= 6 ; row++ ))
do
    (( blockYpos++ ))
    blockXpos=$firstColumnX
    for (( column = 1 ; column <= 10 ; column++))
    do
        (( blockXpos++ ))
        msg="Creating block at ($blockXpos, $blockYpos, $blockZpos)";
        echo $msg
        #postToChat "$msg"
        setBlock $blockXpos $blockYpos $blockZpos $(getRandomColouredWoolBlock)
    done
done

