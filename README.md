# fuzzy-mpd

### Dependencies
1. rlwrap : For history support
2. fzf : For fuzzy finding
3. mpc+mpd+ncmpcpp : mpd is the server, and mpc is the client 
   
### Screen Recording

![Sample Screen Recording](https://github.com/Aeres-u99/fuzzy-mpd/raw/main/SampleScreenRecording.mp4)
   
   
### Installation
* Install the dependencies
* Move the script somewhere in path

### Usage

```
# For interactive usage
mpfzf -i

# For Non interactive Usage
# [TBI]
# mpfzf -ni

# Changing Host and Port
mpfzf -i 192.168.1.107 6600
```

### Interactive Mode Support

```
a | add       -- Add Music to playlist from Folder
> | next      -- Play the next Song in Queue
< | previous  -- Play the previous Song in Queue
r | resume    -- Resume the song
p | play      -- Play a song from Playlist
x | remove    -- Remove a song from queeu
u | pause     -- Pause Music
l | list      -- List Songs in Current Queue
q | quit      -- Quit

# TBI
o | repeat
z | random 
s | single 
c | consume
+ | volume up
- | volume down
t | toggle
k | seek
clear
```

