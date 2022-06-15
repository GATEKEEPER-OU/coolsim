#!/usr/bin/env sh

cd $(dirname "$0")/..
PROJECT_DIR=$(pwd)

# echo $PROJECT_DIR

for dir in */ ; do
  [ -L "${d%/}" ] && continue
  if [ -f $dir/package.json ]; then
    echo "# ################################################################# #"
    echo "  $dir contains a Javascript project"
    echo "# ################################################################# #"
    (cd $dir; npm install)
  fi
done
