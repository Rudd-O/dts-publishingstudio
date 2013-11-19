#!/bin/bash
echo "$PATH" | grep -q studio || export PATH="$PATH":/usr/local/studio/utils
[ -n "$STUDIOARCHIVEDIR" ] || export STUDIOARCHIVEDIR=~/Documents
