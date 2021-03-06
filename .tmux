#!/bin/sh

# stuff and things
set -e

if tmux has-session -t Templates 2> /dev/null; then
    tmux attach -t Templates
    exit
fi

# set up a new session

tmux new-session -d -s Templates -n main

# 1. Main window: vim, lf, git status
tmux send-keys -t Templates:main "nvim -c Files" Enter
tmux split-window -t Templates:main -h -c "$PWD"
tmux send-keys -t Templates:main.right "git pull" Enter
tmux send-keys -t Templates:main.right "git status" Enter

# Start it up!
tmux attach -t Templates:main.left
