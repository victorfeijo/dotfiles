scriptencoding utf-8
set encoding=utf-8
set ruler
set number
"set paste
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set list listchars=tab:»·
set ts=2 sw=2 et
set wrap
set viminfo-='100,<100,s10,h
set pastetoggle=<F2>

" mandatory defaults
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" our plugins
Plugin 'gmarik/Vundle.vim'      
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'sickill/vim-pasta'
Plugin 'bling/vim-airline'
Plugin 'townk/vim-autoclose'
Plugin 'rking/ag.vim'
Plugin 'christoomey/vim-system-copy'

" Ruby Bundles
Plugin 'thoughtbot/vim-rspec'           " Run RSpecs from vim
Plugin 'tpope/vim-endwise'              " Auto add end on class, module, def, etc.
Plugin 'ngmy/vim-rubocop'               " Rubocop


call vundle#end()

syntax enable
filetype plugin indent on

" Choose the colorscheme
set background=dark
colorscheme google
let g:solarized_termcolors=256

" Open Nerd Tree
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

"Configure vim airline

" Top separator bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9a

"Rubocopo
let g:vimrubocop_keymap = 0
nmap <leader>rr :RuboCop<CR>
nmap <leader>ra :RuboCop --auto-correct<CR>

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Ctrl-p configuration
" The Silver Searcher
if executable('ag')
  let g:ctrlp_use_caching = 1
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Configure ag word finder
let g:ag_working_path_mode="r"
