export ZSH="$HOME/.local/share/oh-my-zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f $ZDOTDIR/p10k.sh ]] || source $ZDOTDIR/p10k.sh	# load personal prompt config

[[ ! -f $ZDOTDIR/.localrc ]] || source $ZDOTDIR/.localrc	# loads localrc env file

[[ ! -f $ZDOTDIR/.zsh_paths ]] || source $ZDOTDIR/.zsh_paths	# loads paths

[[ ! -f $ZDOTDIR/.zsh_aliases ]] || source $ZDOTDIR/.zsh_aliases	# loads aliases

# Initialize autocomplete here otherwise functions wont be loaded
autoload -U compinit
compinit

[[ ! -f $ZDOTDIR/.zsh_autocomp ]] || source $ZDOTDIR/.zsh_autocomp	# load completions

[[ ! -f $ZDOTDIR/.zsh_functions ]] || source $ZDOTDIR/.zsh_functions	# load functions

############################################################################################
# zsh general config settings
export TERM=xterm-256color
ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"       # If true _ and - will be interchangeable.
WORDCHARS=${WORDCHARS//\/}      # Don't consider certain characters part of the word
PROMPT_EOL_MARK=""              # hide EOL sign ('%')

setopt LOCAL_OPTIONS            # allow functions to have local options
setopt LOCAL_TRAPS              # allow functions to have local traps
setopt HIST_VERIFY
setopt EXTENDED_HISTORY         # add timestamps to history
setopt HIST_IGNORE_ALL_DUPS     # don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt autocd                   # change dir by typing its name
setopt notify                   # report the status of background jobs immediately
setopt complete_aliases         # don't expand aliases _before_ completion has finished

# zsh directory stack
setopt AUTO_PUSHD               # Push working dir to top of stack
setopt PUSHD_IGNORE_DUPS        # Don't store dupes on stack
setopt PUSHD_SILENT             # Don't print the dir stack after pushd or popd

# configure keybindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

# Command History Settings
# Keep below oh-my-zsh source or omz will overwrite these values
HISTFILE="$XDG_DATA_HOME/zsh/zsh_history"
HISTSIZE=999999999
SAVEHIST=999999999
export HISTTIMEFORMAT="[%F %T] "	# set time format
setopt EXTENDED_HISTORY 		# save timestamp to history
#setopt INC_APPEND_HISTORY		# add commands to history immediately
setopt HIST_FIND_NO_DUPS		# dupe cmds filtered out when stepping through
