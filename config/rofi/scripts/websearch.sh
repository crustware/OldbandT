#!/usr/bin/sh
# rofi-surfraw-websearch: web search via surfraw
BROWSER=librewolf
surfraw -browser=$BROWSER $(sr -elvi | awk -F'-' '{print $1}' | sed '/:/d' | awk '{$1=$1};1' | rofi rofi -location 6 -yoffset -60 -line-padding 4 -columns 1 -width 20 -lines 10 -padding 25 -kb-row-select "Tab" -kb-row-tab "Control+space" -dmenu -mesg ">>> Tab = Autocomplete" -i -p "websearch")
