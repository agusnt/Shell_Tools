#!/bin/zsh
# @Author: Navarro Torres, Agustin (agusnavarro11@gmail.com)
# @Github: agusnt
# @WebPage: https://agusnt.github.io

# This programs allow to launch x number of process, wait until one end and
# launch another process

# Change this vars to run the scripts as you want
NUM_PROCESS=4 # Number of parallel program to execute
TIME=60 # Waiting time. We test if a process has finished every X seconds
PROCESS=(
""
)

################################################################################
# This part are the script's core, you probably don't need to touch it
################################################################################
# Var to get the job done
declare -a pid
finished=0
total=${#PROCESS[@]}

# Launch the process
for index in {0..$(($NUM_PROCESS - 1))}; do
    eval "${PROCESS[$index]}" &
    pid+=("$!")
done

# Wait to finish the first process and launch more process
while true; do
    for i in "${pid[@]}"; do
        sleep $TIME
        if [[ ! -d /proc/$i ]]; then
            # Delete the old process 
            del=($i)
            pid=( "${pid[@]/$del}" )
            finished=$((finished + 1))

            # Launch another process
            if [[ $index -ne $total ]]; then
                index=$((index + 1))
                eval "${PROCESS[$index]}" &
                pid+=("$!")
            fi
        fi
    done
    # If all jobs end, we everything
    if [[ $finished -eq $total ]]; then
        break
    fi
done
