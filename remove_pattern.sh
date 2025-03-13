#!/bin/bash

# Ensure an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 '<pattern_to_remove>' [directory]"
    exit 1
fi

# Set the pattern to remove
PATTERN="$1"

# Set the target directory (default to current directory if not provided)
TARGET_DIR="${2:-.}"

# Process from deepest level to top level
find "$TARGET_DIR" -depth -name "*$PATTERN*" | while IFS= read -r old_name; do
    # Generate the new name by removing the pattern
    new_name="$(dirname "$old_name")/$(basename "$old_name" | sed "s/$PATTERN//g")"

    # Only rename if the new name is different
    if [ "$old_name" != "$new_name" ]; then
        mv "$old_name" "$new_name"
        echo "Renamed: $old_name -> $new_name"
    fi
done
