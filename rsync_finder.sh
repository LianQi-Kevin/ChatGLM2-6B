#!/bin/bash

source_dir="/root/autodl-fs/models/ChatGLM2-6B"
target_dir="/root/autodl-tmp/models/ChatGLM2-6B"

# check if target_dir exists
if [ ! -d "$target_dir" ]; then
  echo "Creating $target_dir..."
  mkdir -p "$target_dir"
  rsync -avh --exclude='.git' --exclude='.git/**' --progress "$source_dir/" "$target_dir/"
  echo "$target_dir created and updated"
else
  echo "Comparing source and target folders..."
  rsync -avh --delete --exclude='.git' --exclude='.git/**' --progress "$source_dir/" "$target_dir/"
  echo "Folder comparison complete"
fi

echo "Done!"