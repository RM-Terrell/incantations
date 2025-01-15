#!/bin/bash

echo "Incantations custom scripts loaded"

function get_last_commit_changes() {
    local file_path=$1
    local last_commit_hash=$(git log -1 --pretty=format:"%H" -- $file_path)
    echo "Last commit hash: $last_commit_hash"
    git show $last_commit_hash -- $file_path
}