#!/usr/bin/env sh

cd $(dirname "$0")/..
PROJECT_DIR=$(pwd)

# echo $PROJECT_DIR

for dir in `find . -type d -maxdepth 1`; do
  if [ -f $dir/package.json ]; then
    echo "# ################################################################# #"
    echo "  $dir contains a Javascript project"
    echo "# ################################################################# #"
    (cd $dir; npm install)
    echo
  fi
done
