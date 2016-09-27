" Choose the colorscheme
set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_termcolors=16
let g:solarized_bold=1

" Open Nerd Tree
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

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
nmap <leader>9 <Plug>AirlineSelectTab9a
" Delete the current buffer
nmap ,d :bd<CR>

" Remove arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Map bigger line moves
noremap <C-U> 12<C-U>
noremap <C-D> 12<C-D>

" Rubocop
let g:vimrubocop_keymap = 0
nmap <leader>rr :RuboCop<CR>
nmap <leader>ra :RuboCop --auto-correct<CR>

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Ctrl-p configuration
" The Silver Searcher
if executable('ag')
  let g:ctrlp_use_caching = 0
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "'
endif

