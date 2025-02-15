#!/bin/bash


function get_last_commit_changes() {
    local file_path=$1
    local last_commit_hash=$(git log -1 --pretty=format:"%H" -- $file_path)
    echo "Last commit hash: $last_commit_hash"
    git show $last_commit_hash -- $file_path
}

# Function to copy the output of the last command to the clipboard
cmd_to_clip () {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # pb copy is a macOS specific command
    echo -n $BUFFER | pbcopy
  else
    # assuming if not macOS, it's linux
    # wl-copy is a linux specific command (weyland). 
    wl-copy <<< $BUFFER
  fi
}
zle -N cmd_to_clip
bindkey '^Y' cmd_to_clip

# custom ssh command to login and cd to a directory
# ssh -t username@server "cd directory ; bash --login"

echo "Incantations custom scripts loaded"