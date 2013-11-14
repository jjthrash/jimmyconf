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
  autocmd FileType ruby     set sts=2 sw=2 ts=2 et
  autocmd FileType haml     set sts=2 sw=2 ts=2 et
  autocmd FileType yaml     set sts=2 sw=2 ts=2 et
  autocmd FileType lua      set sts=2 sw=2 ts=2 et

  autocmd FileType objc set sts=4 sw=4 ts=4 et
  autocmd FileType clojure set sts=2 sw=2 ts=2 et
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
nmap <leader>rs :s/\s\+$//<CR>:noh<CR>
map <leader>rs :%s/\s\+$//<CR>:noh<CR>
vmap <leader>rs :s/\s\+$//<CR>:noh<CR>
map <leader>rt :retab<CR>
nmap <leader>q :nohlsearch<CR>

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
map <leader>pw yyp<<I@property (nonatomic, weak)   <ESC>
map <leader>pc yyp<<I@property (nonatomic, copy)   <ESC>
map <leader>po yyp<<I@property (nonatomic, readonly) <ESC>
map <leader>eh :e %<BS>h<CR>
map <leader>em :e %<BS>m<CR>
map <leader>lg yyp:s/"/\\"/ge<CR>INSLog(@"<ESC>A");<ESC>:nohlsearch<CR>
nmap <leader>__ i_<ESC>l~
"}}}

"{{{ NERDTree config
map <silent> <S-TAB> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2 " CWD changes with root of NERDTree
let NERDTreeMinimalUI=1
map <leader>n :NERDTreeFind<CR>
"}}}

"{{{ plist config (http://hints.macworld.com/dlfiles/vim_plist_script.txt)
" ViM autocommands for binary plist files
" Copyright (C) 2005 Moritz Heckscher
"
" Note: When a file changes externally and you answer no to vim's question if
" you want to write anyway, the autocommands (e.g. for BufWritePost) are still
" executed, it seems, which could have some unwanted side effects.
"
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
augroup plist
  " Delete existing commands (avoid problems if this file is sourced twice)
  autocmd!

  " Set binary mode (needs to be set _before_ reading binary files to avoid
  " breaking lines etc; since setting this for normal plist files doesn't
  " hurt and it's not yet known whether or not the file to be read is stored
  " in binary format, set the option in any case to be sure).
  " Do it before editing a file in a new buffer and before reading a file
  " into in an existing buffer (using ':read foo.plist').
  autocmd BufReadPre,FileReadPre *.plist set binary

  " Define a little function to convert binary files if necessary...
  fun MyBinaryPlistReadPost()
          " Check if the first line just read in indicates a binary plist
          if getline("'[") =~ "^bplist"
                  " Filter lines read into buffer (convert to XML with plutil)
                  '[,']!plutil -convert xml1 /dev/stdin -o /dev/stdout
                  " Many people seem to want to save files originally stored
                  " in binary format as such after editing, so memorize format.
                  let b:saveAsBinaryPlist = 1
          endif
          " Yeah, plain text (finally or all the way through, either way...)!
          set nobinary
          " Trigger file type detection to get syntax coloring etc. according
          " to file contents (alternative: 'setfiletype xml' to force xml).
          filetype detect
  endfun
  " ... and call it just after editing a file in a new buffer...
  autocmd BufReadPost *.plist call MyBinaryPlistReadPost()
  " ... or when reading a file into an existing buffer (in that case, don't
  " save as binary later on).
  autocmd FileReadPost *.plist call MyBinaryPlistReadPost() | let b:saveAsBinaryPlist = 0

  " Define and use functions for conversion back to binary format
  fun MyBinaryPlistWritePre()
          if exists("b:saveAsBinaryPlist") && b:saveAsBinaryPlist
                  " Must set binary mode before conversion (for EOL settings)
                  set binary
                  " Convert buffer lines to be written to binary
                  silent '[,']!plutil -convert binary1 /dev/stdin -o /dev/stdout
                  " If there was a problem, e.g. when the file contains syntax
                  " errors, undo the conversion and go back to nobinary so the
                  " file will be saved in text format.
                  if v:shell_error | undo | set nobinary | endif
          endif
  endfun
  autocmd BufWritePre,FileWritePre *.plist call MyBinaryPlistWritePre()
  fun MyBinaryPlistWritePost()
          " If file was to be written in binary format and there was no error
          " doing the conversion, ...
          if exists("b:saveAsBinaryPlist") && b:saveAsBinaryPlist && !v:shell_error
                  " ... undo the conversion and go back to nobinary so the
                  " lines are shown as text again in vim.
                  undo
                  set nobinary
          endif
  endfun
  autocmd BufWritePost,FileWritePost *.plist call MyBinaryPlistWritePost()
augroup END
"}}}

"{{{ ctrlp config
let g:ctrlp_custom_ignore = {
    \ 'dir': '(vendor|out)'
    \ }
"}}}

"{{{ Ack.vim config
let g:ackprg = 'ag -i --nogroup --nocolor --column'
"}}}

"{{{ vim-powerline config
"set fillchars+=stl:\ ,stlnc:\
"}}}

" vim:foldmethod=marker
