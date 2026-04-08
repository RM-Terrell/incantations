#!/bin/bash

# --- ALIASES ---
alias disable_mac_stupidity="sudo spctl --master-disable ; open 'x-apple.systempreferences:com.apple.preference.security'"


# --- FUNCTIONS & SCRIPTS ---
function get_last_commit_changes() {
    local file_path=$1
    local last_commit_hash=$(git log -1 --pretty=format:"%H" -- $file_path)
    echo "Last commit hash: $last_commit_hash"
    git show $last_commit_hash -- $file_path
}

# Function to copy the current line to the clipboard
# Example:
# With the console showing some command like "git commit -m 'really long annoying message you dont want to retype'"
# Hit control + y before hitting enter to copy all of it to clipboard
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
