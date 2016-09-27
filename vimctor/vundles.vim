" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/vundles/
call vundle#begin()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

" ~/.vim/vundles/ to edit them:
runtime allplugins.vundle

"Filetype plugin indent on is required by vundle

call vundle#end()
filetype plugin indent on
