#!/bin/bash
## functest.sh
## Just a place to throw my extra unused functions.
inline-butnot() { 
    # printf "$ yt-dlp " ;
    printf '"%q"' "$( which yt-dlp )"
    printf '"%q" ' a b c d ; 
    printf "\n" ; 
} | tee -a "$YT_DLP_HISTORY" >&2
inline-butnot $[@]