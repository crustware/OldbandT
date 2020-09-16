#!/usr/bin/env bash
BROWSER=firefox
surfraw -browser=$BROWSER "$(grep '^[[:alnum:]]' ~/.config/surfraw/bookmarks | sort -n | wofi -d -ia -p "bookmarks")"
