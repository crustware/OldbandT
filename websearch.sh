#!/usr/bin/env bash
BROWSER=firefox
surfraw -browser=$BROWSER $(sr -elvi | awk -F'-' '{print $1}' | sed '/:/d' | awk '{$1=$1};1' | wofi -d -i -p "Web Search")

