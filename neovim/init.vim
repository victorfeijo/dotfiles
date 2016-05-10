scriptencoding utf-8
set encoding=utf-8
set ruler
set number
set noshowmode " airline already shows me
"set paste
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set mouse=c " removing mouse
set list listchars=tab:»·
set ts=2 sw=2 et
set wrap
set viminfo-='100,<100,s10,h

" mandatory defaults
set nocompatible
filetype off
call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'sickill/vim-pasta'
Plug 'bling/vim-airline'
Plug 'townk/vim-autoclose'
Plug 'rking/ag.vim'
Plug 'christoomey/vim-system-copy'

" Ruby Bundles
Plug 'thoughtbot/vim-rspec'           " Run RSpecs from vim
Plug 'tpope/vim-endwise'              " Auto add end on class, module, def, etc.
Plug 'ngmy/vim-rubocop'               " Rubocop

call plug#end()

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
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" Configure ag word finder
let g:ag_working_path_mode="r"
