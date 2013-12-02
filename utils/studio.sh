#!/bin/bash
echo "$PATH" | grep -q publishingstudio || export PATH="$PATH":/usr/local/dts-publishingstudio/utils
[ -n "$STUDIOARCHIVEDIR" ] || export STUDIOARCHIVEDIR=~/Studio
