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
set smartindent
set autoindent
set nocindent
set wrap
set viminfo-='100,<100,s10,h
set t_Co=256
set noswapfile

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" our plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-pasta'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'townk/vim-autoclose'
Plugin 'rking/ag.vim'

" Ruby Bundles
Plugin 'vim-ruby/vim-ruby'              " Ruby support on vim
Plugin 'kana/vim-textobj-user'          " Create your own text objects (used by vim-textobj-rubyblock)
Plugin 'nelstrom/vim-textobj-rubyblock' " Ruby text objects
Plugin 'tpope/vim-rails'                " Rails support for vim
Plugin 'thoughtbot/vim-rspec'           " Run RSpecs from vim
Plugin 'tpope/vim-bundler'              " Support for bundler inside vim
Plugin 'tpope/vim-endwise'              " Auto add end on class, module, def, etc.
Plugin 'ngmy/vim-rubocop'               " Rubocop

call vundle#end()
" Now we can turn our filetype functionality back on
syntax enable
filetype plugin indent on

"Set the color theme
set background=dark
colorscheme solarized

" Open Nerd Tree
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>


" Configuratins syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'

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
nmap <leader>9 <Plug>AirlineSelectTab9

"Rubocopo
let g:vimrubocop_keymap = 0
nmap <leader>r :RuboCop<CR>

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Ctrl-p configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = 'find %s -type f'

" Ag configs
let g:ag_working_path_mode="r"
