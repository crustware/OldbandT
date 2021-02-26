#!/usr/bin/sh
# rofi-surfraw-websearch: web search via surfraw
BROWSER=librewolf
surfraw -browser=$BROWSER "$(cat ~/.config/surfraw/bookmarks | sed '/^$/d' | sed '/^#/d' | sed '/^\//d' | sort -n | rofi -location 6 -yoffset -60 -line-padding 4 -columns 1 -width 20 -lines 10 -padding 25 -dmenu -mesg ">>> Edit to add new bookmarks at ~/.config/surfraw/bookmarks" -i -p "bookmarks")"