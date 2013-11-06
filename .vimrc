call pathogen#infect()

"{{{ Stuff specifically for GUI-mode...
syntax on
set guifont=Consolas:h12
set background=dark
set mousehide
"}}}

"{{{ Color scheme and syntax highlignting
set term=xterm-256color
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colors solarized
"}}}

"{{{ General settings...
set guioptions=egmLt " No scrollbars or toolbar
set nocompatible
set backspace=indent,eol,start
set textwidth=0
set wrapmargin=0
set nowrap
set linebreak
set showbreak=..
set nobackup
set viminfo='20,\"50,n$HOME/.viminfo
set ruler
set tabstop=4
set showmatch
set shiftwidth=4
set expandtab
set softtabstop=4
set visualbell t_vb=
set smartcase
set ignorecase
set incsearch
set hls
set hidden
set number
"nmap h hga
"nmap j jga
"nmap k kga
"nmap l lga
set lcs+=tab:»\ ,eol:¶,trail:·,extends:_,precedes:_
set listchars+=tab:¸\ ,eol:\ ,trail:·,extends:»,precedes:«
set list
if !has("gui_running")
  command! W w !sudo tee % > /dev/null
endif
let mapleader = ","
set comments=
set noautoindent
set efm=%f(%l)\ :\ %t%*\\D%n:\ %m,%*[^\"]\"%f\"%*\\D%l:\ %m,%f(%l)\ :\ %m,%*[^\ ]\ %f\ %l:\ %m,%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,%f\|%l\|\ %m,%f(%l\\,%c):%m,%f:%l:%m,%f\|%l\|\ %m
behave xterm                " mouse support
set selectmode=mouse        " mouse support
syn keyword cTodo contained TODO FIXME XXX \todo
"set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P %{fugitive#statusline()}
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set tags=tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags

if has("autocmd")
  au FileType * setl fo-=cro "disable all comment stupidity
endif

let g:local_vimrc=".vimrc_local"

"}}}

"{{{ Config for specific file types
if has("autocmd")
  autocmd FileType cucumber set sts=2 sw=2 ts=2 et
  autocmd FileType ruby set sts=2 sw=2 ts=2 et
  autocmd FileType haml set sts=2 sw=2 ts=2 et

  autocmd FileType objc set sts=4 sw=4 ts=4 et
endif
"}}}

"{{{ Esperanto (Uses Latin-3)
digraph Gx 216
digraph gx 248
digraph Hx 166
digraph hx 182
digraph Jx 172
digraph jx 188
digraph Cx 198
digraph cx 230
digraph Sx 222
digraph sx 254
digraph Ux 221
digraph ux 253
"}}}

"{{{ Plugin maps
map <silent> <S-TAB> :NERDTreeToggle<CR>
map <silent> <TAB> :call BufferList()<CR>
"}}}

"{{{ Maps
map <leader>un yyp:s/./-/g:nohlsearch
map <F1> <ESC> " ThinkPad keyboard with poorly placed Esc key
imap <F1> <ESC>
map <leader>i^ :s/^/ /
vmap <leader>i^ :s/^/ /
map <leader>av1 :g/^$/d:g^$/d:%s/\s*-\?\s*(.*$
map <leader>av2 :%s/^\d\+\./#
map <leader>bx yy2p:s/./ /g<CR>:s/^./<Bar><CR>:s/.$/<Bar><CR>,
vmap <leader>, :s/$/,<CR>gvJ$x
vmap <leader>! dO<!--<CR>--><ESC>P
vmap <leader>* dO/*<CR>*/<ESC>P
vmap <leader># :s/^/#<CR>
vmap <leader>; :s/^/;<CR>
map <leader>cd :cd %:p:h
map <leader>vs :vsplit
map <leader>vf ,vsgf
map <leader>cc :s/^/\/\//
map <leader>cu :s/^\(\s*\)\/\//\1/
map Y y$
vmap <leader>dc !dc<CR>
nmap <leader>dc V!dc<CR>
nmap <leader>xml :%!xmllint --format -<CR>:set ft=xml<CR>

" dragvisuals.vim
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
let g:DVB_TrimWS = 1

" vmath.vim
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++                 
"}}}

"{{{ Obj-C maps
map <leader>pr yyp<<I@property (nonatomic, retain) <ESC>
map <leader>pa yyp<<I@property (nonatomic, assign) <ESC>
map <leader>ps yyp<<I@property (nonatomic, strong) <ESC>
map <leader>pw yyp<<I@property (nonatomic, weak) <ESC>
map <leader>eh :e %<BS>h<CR>
map <leader>em :e %<BS>m<CR>
"}}}

"{{{ NERDTree config
let NERDTreeChDirMode=2 " CWD changes with root of NERDTree
let NERDTreeMinimalUI=1
map <leader>n :NERDTreeFind<CR>
"}}}

" vim:foldmethod=marker
