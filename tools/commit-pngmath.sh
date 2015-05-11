#!/bin/bash

# Create "pngmath" branch on top of current "master".

set -ex

test -z "$(git status --short)"
test "$(git rev-parse --abbrev-ref HEAD)" = "master"

git checkout -B pngmath master
sed -i -r 's/# (_use_pngmath = True)/\1/' source/conf.py
git add source/conf.py
git commit --message "Set: _use_pngmath = True" source/conf.py
