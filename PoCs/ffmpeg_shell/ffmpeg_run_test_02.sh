#!/bin/bash

# script stored in docker container
# to call from outside as a single run command

VIDEO_DOCKER_DIR="/home/crumbles/ffmpeg/bin"
VIDEO_LOCAL_DIR="/home/ec2-user/cineaste/code/PoCs"

# ****************************************************************
# ****  log with datetime stamp
# ****************************************************************
#usage: log 'Hello World'
function log {
   timestamp=$(date "+%Y-%m-%d %H:%M:%S")
   echo "$timestamp $@"
}

CALLER_ID=$1
#OUTPUT_DIR=$2

#log "START: [$CALLER_ID]"
#log "OUTPUT_DIR: [$OUTPUT_DIR]"
echo "$CALLER_ID,START,$(date '+%H:%M:%S')"

START=$(date +%s);

FFMPEG_COMMAND="ffmpeg -threads 0 -stats -i  /home/crumbles/ffmpeg/bin/Buster.Keaton.The.Three.Ages.ogv -loop 0 -final_delay 500 -c:v gif -f gif -ss 00:49:42 -t 5 -"
$FFMPEG_COMMAND > $CALLER_ID.trow_ball.gif



# -threads 0


END=$(date +%s);
#ELAPSED_TIME=`echo $((END-START)) | awk '{print int($1/60)":"int($1%60)}'`
ELAPSED_TIME=$(($END-$START))

echo "$CALLER_ID,FINISH,$(date '+%H:%M:%S')"
echo "$CALLER_ID,ELAPSED_TIME,$ELAPSED_TIME"
#log "ELAPSED_TIME: [$ELAPSED_TIME]"



#log "$0 ALL DONE"


# ****************************************************************
# Notes
# docker run -it -v /Users/madpole/data/dev/aws/andrew.szymanski.jobs/crumbles/code/PoCs/ffmpeg_shell:/home/crumbles/host_dir madpole/pocs /home/crumbles/host_dir/ffmpeg_docker_run.sh
# 
# 
# 
# 
# ****************************************************************
