#!/bin/bash
## yt-dlp-history.sh
## Simple wrapper for yt-dlp intended to provide history of runs.
## USAGE: source this file in ~/.bashrc
## e.g: source $HOME/bin/yt-dlp-history.sh
## AUTHOR: Ctrl-S
## CREATED: 2022-03-27
## MODIFIED: 2022-03-27

export YT_DLP_HISTORY="$HOME/.YT-DLP-HISTORY" # Filepath for yt-dlp invocation history.

## Allow wrapper function to know the actual yt-dlp executable path:
if [ ! -v YT_DLP_PATH ]; then # If variable is not set:
    export YT_DLP_PATH="$(which yt-dlp)" # Command that normally gets run by '$ yt-dlp'.
    # export YT_DLP_PATH="$HOME/.local/bin/yt-dlp" # Alternative
fi


yt-dlp() {
    ## Wrapper function to log invocations
    ## ALL args to this function should get passed to yt-dlp verbatim.
    ## Log time:
    echo "## Invoked by '$USER' at $(date '+%y-%m-%dT%H%M%S%z=@%s') with args:" | tee -a "$YT_DLP_HISTORY" >&2
    ## Log command itself:
    # builtin printf '"%q" ' "$0" | tee -a "$YT_DLP_HISTORY" >&2 # '/bin/bash'
    # builtin printf '"%q" ' "$YT_DLP_PATH" | tee -a "$YT_DLP_HISTORY" >&2 # ~/.local/bin/yt-dlp
    builtin printf '$ yt-dlp ' | tee -a "$YT_DLP_HISTORY" >&2 # '$ yt-dlp '
    ## Log args:
    builtin printf '"%q" ' "$@" | tee -a "$YT_DLP_HISTORY" >&2
    builtin printf '\n'  | tee -a "$YT_DLP_HISTORY" >&2 # (Because format string does not play nice)
    ## Run with given args:
    $YT_DLP_PATH "$@"
}
