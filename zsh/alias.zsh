# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# convenience aliases for editing configs
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'
alias en='vim ~/.config/nvim/init.vim'

# switch from vim to nvim
alias nv='nvim'

# Switch from cat to bat
alias cat='bat'

# dev container
alias dc-build='devcontainer build --workspace-folder "$(pwd)"'
alias dc-up='devcontainer up --workspace-folder "$(pwd)"'
alias dc-shell='devcontainer exec --workspace-folder "$(pwd)" -- bash'
alias dc-down='devcontainer down --workspace-folder "$(pwd)"'

