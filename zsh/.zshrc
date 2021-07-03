# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
#  export TERM="xterm-256color"
setopt RM_STAR_WAIT
setopt interactivecomments
setopt CORRECT
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"


# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-256color)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# export TERM=xterm-256color
#
# Allow copy special characters on terminal sessions
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#oading plugin
# autoload -U compinit && compinit
autoload -Uz colors && colors

# Some of my config's
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
# Aliases
source ~/.oh-my-zsh/lib/alias.zsh

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Android adb connecting
export ANDROID_HOME=$HOME/Library/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Work commands and aliases

export PATH="$HOME/go/bin:$PATH"
export GOPATH="$HOME/go"

# Python pyenv
export PYENV_SHELL=zsh
source '/opt/homebrew/Cellar/pyenv/2.0.2/libexec/../completions/pyenv.zsh'
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add NVM Path
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# SCM breeze
[ -s "/Users/victorfeijo/.scm_breeze/scm_breeze.sh" ] && source "/Users/victorfeijo/.scm_breeze/scm_breeze.sh"

function rspec {
  exec_scmb_expand_args rspec $@
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/victorfeijo/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/victorfeijo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/victorfeijo/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/victorfeijo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# FZF configs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='
  --color dark,hl:33,hl+:37,fg+:235,bg+:242,fg+:254
  --color info:254,prompt:37,spinner:108,pointer:235,marker:235
'
bindkey '^P' fzf-file-widget


# Mariadb 10.2

# compile flags
# LDFLAGS:  -L/usr/local/opt/mariadb@10.2/lib
# CPPFLAGS: -I/usr/local/opt/mariadb@10.2/include
# export PKG_CONFIG_PATH="/usr/local/opt/mariadb@10.2/share/pkgconfig"
# export PATH="/usr/local/opt/mariadb@10.2/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/victorfeijo/code/webhooks/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/victorfeijo/code/webhooks/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/victorfeijo/code/webhooks/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/victorfeijo/code/webhooks/node_modules/tabtab/.completions/sls.zsh

export RETRY_COUNT=0
