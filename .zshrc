# General Options
setopt no_beep # don't beep on error
setopt autocd # cd by just typing the dirname
setopt autopushd  # directory on the stack with cd
setopt pushdminus # saying cd -3 feels more natural
setopt pushdsilent # don't print the stack every time
setopt pushdtohome  # pushd without arguments does `pushd ~', like cd.
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack
setopt cdablevars # if the argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory.
setopt extendedglob # Enable extended globbing, do stuff like ls **/foosetopt
setopt glob_complete # Cycle through glob matches instead of expanding them all
setopt rcquotes # Escape ' with ''
DIRSTACKSIZE=5 # Directory stack depth
unsetopt nomatch # Pass * to command rather than error if no match, like bash

# History
setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt inc_append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt share_history # share command history data
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
export HISTSIZE=4096
export SAVEHIST=4096
export HISTFILE=$HOME/.zsh_history

# Better History Management, Using Partial Term and Arrow Keys
# https://coderwall.com/p/jpj_6q
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Enable colors
autoload -U colors
colors
export CLICOLOR=1

# Basic Setup
export VISUAL=vim
export EDITOR=$VISUAL
export PAGER='less'
export LESS=-Ri

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# General aliases
alias la='ls -a'
alias ll='la -lh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias path='echo $PATH | tr -s ":" "\n"' # pretty print the path
alias history='history 1'
alias which='type -a'

# Path
export PATH=$HOME/bin:$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Ruby
alias ruby='ruby -w'
alias rake="noglob rake"
export ri="--format ansi -T"

# Node
alias ng='npm ls -g --depth=0'
alias nl='npm ls --depth=0'

# PostgreSQL
alias pg.start="pg_ctl -D /usr/local/var/postgres start"
alias pg.stop="pg_ctl -D /usr/local/var/postgres stop"
alias pg.status="pg_ctl -D /usr/local/var/postgres status"

# Brew
export HOMEBREW_GITHUB_API_TOKEN=""
alias brewdeps='brew list | while read cask; do echo -n $fg[blue] $cask $fg[white]; brew deps $cask | awk ''{printf(" %s ", $0)}''; echo ""; done'

# Tab Completions
autoload -U compinit
compinit

# Pure Prompt
fpath=( "$HOME/.zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt pure

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
