#!/bin/env sh
# Ansi color code variables
red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

DBFILE=~/.musicdb
HOST="127.0.0.1"
PORT="6600"
fPROMPT="mpfzf >>"


# Dependency Check
if [ "$(command -v rlwrap)" ]; then
    if [ "$(command -v mpc)" ]; then
        if [ "$(command -v fzf)" ]; then
            >&2 echo -e "${green}Dependency Check was Successfull${reset}"
        else
            >&2 echo -e "${red}fzf${reset} not found"
        fi
    else
        >&2 echo -e "${red}mpc${reset} not found"
    fi
else
    >&2 echo -e "${red}rlwrap${reset} not found"
fi

function __create_db() {
    mpc listall > ~/.musicdb
}

function __add() {
    echo ""
    __create_db

}

function __play() {
    mpc play $(mpc playlist | grep -n ".*" | sed "s/:/ /g" |fzf --reverse --prompt "mpfzf >"| cut -d " " -f 1)
    sleep 1
}

function __remove() {
   >&2 echo -e "Press ${red}<CTRL+C>${reset} to exit."
   PLAY=$(cat $DBFILE | fzf --height 40% --prompt "$PROMPT" --reverse)
   echo $PLAY
   sleep 5
}


function __interactive() {
>&2 echo -e "Press ${red}<CTRL+C>${reset} to exit."
while :
    do
        #rlwrap sh -c "echo -e -n \"${green}Action${reset}>> \" "
        SELECTION=$(rlwrap -pGreen -S 'Action >> ' -H '.mpd.hist' -o cat)
        #echo $SELECTION
    case $SELECTION
        in
            a | add     )   __add ;;
            p | play    )   __play ;;
            r | remove  )   __remove  ;;
            u | pause   )   __pause ;;
                      * )   __mhelp
    esac
done
}

function __mhelp() {
    echo ""
    echo "a | add       -- Add Music to playlist from Folder"
    echo "p | play      -- Play a song from Playlist"
    echo "r | remove    -- Remove a song from queeu"
    echo "u | pause     -- Pause Music"
    echo ""
}


function __help() {
    echo "Usage: $0 [[ -i | --interactive ] [ -h | --host ] [ -p | --port ]]"
}

INTERACTIVE=$1
if [ "$2" ]
then
    HOST=$2
    if [ "$3" ]
    then
        PORT=$3
    fi
fi

case $INTERACTIVE
    in
    -i | --interactive ) __interactive ;;
    -h | --help )       __help
                        exit ;;
                    * ) __help
                        exit 1
esac
