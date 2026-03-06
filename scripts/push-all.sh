#!/usr/bin/env bash
set -euo pipefail

submodules=$(git submodule status | awk '{print $2}')
for module in $submodules; do
  pushd "$module" > /dev/null
  
  echo "$module"
  remotes=$(git remote)
  if [[ $remotes == *"upstream"* ]]; then
    git push -u origin cn || true
  else
    echo "  skipping"
  fi
  popd > /dev/null
done
