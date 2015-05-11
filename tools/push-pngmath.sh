#!/bin/bash

# Create "pngmath" branch and push it to origin.

set -ex
tools/commit-pngmath.sh
git push --force origin pngmath
git checkout master
