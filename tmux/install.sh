DIRECTORY="$HOME/.tmux/plugins/tpm"

cp tmux/.tmux.conf ~/.tmux.conf

if [ ! -d  "$DIRECTORY" ]; then
  git clone https://github.com/tmux-plugins/tpm $DIRECTORY
fi

tmux source ~/.tmux.conf

echo "Type in terminal: prefix + r , and then prefix + I"
