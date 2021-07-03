DIRECTORY="$HOME/.vim/autoload/plug.vim"

cp vimctor/.vimrc ~/.vimrc

if [ ! -d  "$DIRECTORY" ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +PlugInstall
