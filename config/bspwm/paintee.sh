#!/bin/bash

# Paintee
# A script to get colours from xrdb & deploy it to cache
# Then refresh URxvt colour on the fly
# Cheers! Addy

getcolors () {
	FOREGROUND="$(xrdb -query | grep 'foreground:'| awk '{print $NF}')"
	BACKGROUND="$(xrdb -query | grep 'background:'| awk '{print $NF}')"
	CURSOR="$(xrdb -query | grep 'cursorColor:'| awk '{print $NF}')"
	BLACK="$(xrdb -query | grep 'color0:'| awk '{print $NF}')"
	RED="$(xrdb -query | grep 'color1:'| awk '{print $NF}')"
	GREEN="$(xrdb -query | grep 'color2:'| awk '{print $NF}')"
	YELLOW="$(xrdb -query | grep 'color3:'| awk '{print $NF}')"
	BLUE="$(xrdb -query | grep 'color4:'| awk '{print $NF}')"
	MAGENTA="$(xrdb -query | grep 'color5:'| awk '{print $NF}')"
	CYAN="$(xrdb -query | grep 'color6:'| awk '{print $NF}')"
	WHITE="$(xrdb -query | grep 'color7:'| awk '{print $NF}')"
	ALTBLACK="$(xrdb -query | grep 'color8:'| awk '{print $NF}')"
	ALTRED="$(xrdb -query | grep 'color9:'| awk '{print $NF}')"
	ALTGREEN="$(xrdb -query | grep 'color10:'| awk '{print $NF}')"
	ALTYELLOW="$(xrdb -query | grep 'color11:'| awk '{print $NF}')"
	ALTBLUE="$(xrdb -query | grep 'color12:'| awk '{print $NF}')"
	ALTMAGENTA="$(xrdb -query | grep 'color13:'| awk '{print $NF}')"
	ALTCYAN="$(xrdb -query | grep 'color14:'| awk '{print $NF}')"
	ALTWHITE="$(xrdb -query | grep 'color15:'| awk '{print $NF}')"
}

cachecolors () {
	read -d '' cache <<- EOF
	FOREGROUND="${FOREGROUND}"
	BACKGROUND="${BACKGROUND}"
	CURSOR="${CURSOR}"
	BLACK="${BLACK}"
	RED="${RED}"
	GREEN="${GREEN}"
	YELLOW="${YELLOW}"
	BLUE="${BLUE}"
	MAGENTA="${MAGENTA}"
	CYAN="${CYAN}"
	WHITE="${WHITE}"
	ALTBLACK="${BLACK}"
	ALTRED="${RED}"
	ALTGREEN="${GREEN}"
	ALTYELLOW="${YELLOW}"
	ALTBLUE="${BLUE}"
	ALTMAGENTA="${MAGENTA}"
	ALTCYAN="${CYAN}"
	ALTWHITE="${WHITE}"
	EOF
}

sendescape () {
	for term in /dev/pts/[0-9]*; do
        printf "%b" "\033]10;$FOREGROUND\007" > "$term" &
        printf "%b" "\033]11;$BACKGROUND\007" > "$term" &
        printf "%b" "\033]708;$BACKGROUND\007" > "$term" &
        printf "%b" "\033]12;$CURSOR\007" > "$term" &
        printf "%b" "\033]4;0;$BLACK\007" > "$term" &
        printf "%b" "\033]4;1;$RED\007" > "$term" &
        printf "%b" "\033]4;2;$GREEN\007" > "$term" &
        printf "%b" "\033]4;3;$YELLOW\007" > "$term" &
        printf "%b" "\033]4;4;$BLUE\007" > "$term" &
        printf "%b" "\033]4;5;$MAGENTA\007" > "$term" &
        printf "%b" "\033]4;6;$CYAN\007" > "$term" &
        printf "%b" "\033]4;7;$WHITE\007" > "$term" &
        printf "%b" "\033]4;8;$ALTBLACK\007" > "$term" &
        printf "%b" "\033]4;9;$ALTRED\007" > "$term" &
        printf "%b" "\033]4;10;$ALTGREEN\007" > "$term" &
        printf "%b" "\033]4;11;$ALTYELLOW\007" > "$term" &
        printf "%b" "\033]4;12;$ALTBLUE\007" > "$term" &
        printf "%b" "\033]4;13;$ALTMAGENTA\007" > "$term" &
        printf "%b" "\033]4;14;$ALTCYAN\007" > "$term" &
        printf "%b" "\033]4;15;$ALTWHITE\007" > "$term" &
	done
}

main () {
	if [ -e ~/.cache/paintee ]; then
	rm ~/.cache/paintee
	fi

	getcolors
	cachecolors
	echo "$cache" > ~/.cache/paintee
	sendescape
}

main

