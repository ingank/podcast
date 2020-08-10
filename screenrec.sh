#!/bin/bash

# init
tmux kill-server
UUID=$(uuid -v 4)
STARTSEC=$(date "+%s")
echo ${UUID} >uuid.txt

# tmux-session
tmux new-session -s "RECORD" -d
tmux split-window -v -t "RECORD"
tmux select-pane -U
tmux send-keys -t "RECORD" "./record_v.sh" C-m
tmux select-pane -D
tmux send-keys -t "RECORD" "./record_a.sh" C-m
tmux attach -t "RECORD"
tmux kill-server

# filename-building
STOPFULL=$(date "+%Y.%m.%d_%H.%M.%S")
STOPSEC=$(date "+%s")
DIFFSEC=$(expr $STOPSEC - $STARTSEC)

# video-audio-muxing
ffmpeg -i "$UUID.mp4" -i "$UUID.wav" -c:v copy -c:a aac -b:a 224k "$UUID-muxed.mp4"

# filename-management
mv "$UUID.mp4" "${STOPFULL}_${DIFFSEC}.mp4"
mv "$UUID.wav" "${STOPFULL}_${DIFFSEC}.wav"
mv "$UUID-muxed.mp4" "${STOPFULL}_${DIFFSEC}_muxed.mp4"
rm -f uuid.txt
