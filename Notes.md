### mpc + fzf

* Something that allows searching and queuing
* Something that is interactive
* Allows searching music
* Allows adding music
* Allows viewing current playing
* colors!
* Customize the prompt
* 
* list
* 

mpc listall -> a simple db file.
using fzf to search through it
interactive is cool
* Play a song from current queue
mpc play $(mpc playlist | grep -n ".*" | fzf | cut -d ":" -f 1)
* looks better
* mpc play $(mpc playlist | grep -n ".*" | sed "s/:/ /g" |fzf | cut -d " " -f 1)
* mpc play $(mpc playlist | grep -n ".*" | sed "s/:/ /g" |fzf --reverse --prompt "mpfzf >"| cut -d " " -f 1)
