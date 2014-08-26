
#!/bin/bash

# NOTE source used in dot form here
# Alternative would be :
# source "./connection.sh"
. 'mcpi/minecraft.sh'


function displayAvailableCameraModes(){
    echo "Available camera modes are:"
    echo "normal, follow, fixed"
}

function printUsage(){
    echo "Usage : bash script.sh normal [entityId]"
    echo "Usage : bash script.sh follow [entityId]"
    echo "Usage : bash script.sh fixed Xcoord Ycoord Zcoord"
}
minNumOfParams=1
if [ $# -ge $minNumOfParams ];
then
    #First thing to do is create a connection to the Minecraft world
    connection_create
    cameraMode=$1
    
    case $cameraMode in
        "follow")
            if [ $# -eq 1 ]
            then
                camera_setFollow
            elif [ $# -eq 2 ]
            then
                camera_setFollow $2
            else
                echo "expected 1 or 2 arguments but got $#"
                printUsage
                exit
            fi
            ;;
        "normal")
            if [ $# -eq 1 ]
            then
                camera_setNormal
            elif [ $# -eq 2 ]
            then
                camera_setNormal $2
            else
                echo "expected 1 or 2 arguments but got $#"
                printUsage
                exit
            fi
            ;;

        "fixed")
            if [ $# -eq 4 ]
            then
               camera_setFixed $2 $3 $4
            else
                echo "expected 4 arguments but got $#"
                printUsage
                exit
            fi
            ;;
        *)
            echo "unknown camera mode \"$1\" encountered"
            displayAvailableCameraModes
            printUsage
            exit
    esac
else
    echo "insufficient parameters given"
    echo "Require minimum of $minNumOfParams, got $#"
    printUsage
    exit 0
fi




