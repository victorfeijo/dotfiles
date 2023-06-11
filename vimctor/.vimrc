" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

scriptencoding utf-8
set encoding=utf-8
set number
set relativenumber
set shell=/bin/zsh
set wildmenu
set wildmode=full
set laststatus=2                "Enable airline
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set cursorline
set clipboard=unnamed
set linebreak               " Break long lines by word, not char"
set hidden
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes


"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb
set nowritebackup

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set pastetoggle=<F2>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=spec/support/fixtures/vcr_cassettes/**

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" =============== Map commands =====================

:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Map bigger line moves
noremap <C-U> 12<C-U>
noremap <C-D> 12<C-D>

" Delete the current buffer
nmap ,d :bd<CR>

" These are things that I mistype and want ignored.
nmap Q  <silent>
nmap q: <silent>
nmap K  <silent>

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down
" one entire line. with
" line wrapping on, this can cause the cursor to actually skip a few lines
" on the screen because
" it's moving from line N to line N+1 in the file. I want this to act more
" visually -- I want `down'
" to mean the next line on the screen
nmap j gj
nmap k gk

imap <C-c> <Esc>

" ================ Plugins ==============
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sickill/vim-pasta'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'raimondi/delimitmate'
Plug 'rking/ag.vim'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'victorfeijo/binding-pry-vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'iCyMind/NeoSolarized'
" Plug 'junegunn/fzf', { 'tag': '0.41.0' }
Plug 'junegunn/fzf'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'chemzqm/wxapp.vim'
" Plug 'ctrlpvim/ctrlp.vim'

" WakeTime
Plug 'wakatime/vim-wakatime'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'

" Typescript
Plug 'leafgarland/typescript-vim'

" JS Framework
Plug 'posva/vim-vue'

" html / templates
Plug 'gregsexton/MatchTag', { 'for': ['html', 'eruby'] } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': ['html', 'eruby'] } " html5 support
Plug 'slim-template/vim-slim'
Plug 'nikvdp/ejs-syntax'

" Ruby Bundles
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'rb'] } " Auto add end on class, module, def, etc.
Plug 'thoughtbot/vim-rspec'

" Python
Plug 'python-mode/python-mode', { 'for': ['python', 'py'] }

" Elixir
Plug 'elixir-editors/vim-elixir', { 'for': ['elixir'] }

" Ethereum
Plug 'tomlion/vim-solidity'

call plug#end()

syntax enable
filetype plugin indent on

" Choose the colorscheme
set termguicolors
colorscheme NeoSolarized
set background=dark
set t_ut=
set t_Co=256

" Open Nerd Tree
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

" FZF configuration
" Search the selected word
set rtp+=~/.fzf
let g:fzf_layout = { 'down': '~30%' }
let $FZF_DEFAULT_COMMAND = 'ag --ignore sorbet/ -g ""'
nmap <C-p> :FZF<CR>
nmap <C-i> :Ag! "\b<cword>\b" <CR>

" Airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'

" JSX on javascript files
let g:jsx_ext_required = 0

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

" Source Vim configuration file and install plugins
nnoremap <silent><leader>p :source ~/.vimrc \| :PlugInstall<CR>

" Pymode
au FileType python set tabstop=4
au FileType python set tabstop=4
au FileType python set softtabstop=4
au FileType python set shiftwidth=4
au FileType python set textwidth=120
au FileType python set expandtab
au FileType python set autoindent
au FileType python set fileformat=unix
au FileType python set wrap

let python_highlight_all=1
let g:pymode_options_max_line_length = 120
let g:pymode_options_colorcolumn = 0
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_doc = 0
let g:pymode_folding = 0

" Coc Confs
let g:coc_global_extensions = ['coc-tsserver']

if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <C-l> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Ale Confs
let g:ale_sign_error = ''
let g:ale_echo_msg_error_str = ''
let g:ale_sign_warning = ''
let g:ale_echo_msg_warning_str = ''
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': [],
\   'ruby': ['sorbet', 'rubocop', 'ruby'],
\   'eruby': [],
\   'python': ['flake8']
\}
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint', 'prettier'],
\  'typescriptreact': ['prettier', 'eslint'],
\  'vue': ['eslint'],
\  'scss': ['prettier'],
\  'html': ['prettier']
\}
let g:ale_fix_on_save = 1
let g:ale_virtualtext_cursor = 'disabled'

" Gitgutter
autocmd BufWritePost * GitGutter

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
