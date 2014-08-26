#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'

#First thing to do is create a connection to the Minecraft world
connection_create



while [ 1 ]
do
   read -a events <<< $( events_pollBlockHits )

   if [ ${#events[*]} -gt 0 ]
   then
       for e in $events
       do 
           msg="(Block_Event.HIT, $events)"
       
           # Print to standard output (terminal probably)
           echo $msg
       done
   fi

done

