"{{{ stuff specifically for GUI-mode...
if version >= 500
  " switch syntax highlighting on when the terminal has colors;
  " switch on highlighting the last used search pattern.
  if &t_Co > 2 || has("gui_running")

    " on terminal and in gui mode, background is dark...
    set background=dark
    syntax on
    hi Folded guifg=Black guibg=DarkMagenta gui=bold

    " highlight the most previous search on start-up...
    "set hlsearch

    " for syntax colors; must be after ``syntax on''
    "source $HOME/_vim_syntax
  endif

  if has("gui_running")

    " set the font to use
    "set guifont=Lucida_Console:h12
    "set guifont=Courier_New:h12
    "set guifont="-adobe-courier-medium-r-normal-*-*-120-*-*-m-*-iso8859-3"
    set guifont=Courier_New:h8:cANSI
    "set guifont=NSimSun:h10:cANSI


    " make the command line one line high
    set ch=1

    " Let Windows process the Alt-key
    set winaltkeys=yes
    set mousehide

    " Set text below the last line to the application workspace color
    highlight NonText       guifg=White guibg=Black gui=bold
    highlight StatusLine    guibg=Grey  guifg=Black gui=bold
    highlight StatusLineNC  guibg=Grey  guifg=Black gui=NONE
    highlight VISUAL        guibg=Grey  guifg=Black gui=NONE
    
    " Use a black-background/grey text...
    highlight Normal guibg=Black guifg=Grey

  endif
endif
"}}}

"{{{ General settings...
map <silent> <S-Tab> :TlistToggle<CR>
map <M-F10> :!ruby -r xmp -n -e 'xmp($_, "\%l\t\t\# \%r\n")'<CR>
set nocompatible
set backspace=indent
set textwidth=0
set wrapmargin=0
set nowrap
set linebreak
set showbreak=..
set nobackup
set viminfo='20,\"50,n$HOME/_viminfo
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
nmap h hga
nmap j jga
nmap k kga
nmap l lga
au FileType * setl fo-=cro "disable all comment stupidity
set lcs+=tab:»\ ,eol:¶,trail:·,extends:_,precedes:_
" set listchars+=tab:¸\ ,eol:¶,trail:·,extends:»,precedes:« 
set listchars+=tab:¸\ ,eol:\ ,trail:·,extends:»,precedes:« 
set list
command! W w !sudo tee % > /dev/null

" In text files, always limit the width of text to 78 characters
"autocmd BufRead *.txt set tw=78
"}}}

"{{{ Programming settings
set comments= 
set noautoindent
set efm=%f(%l)\ :\ %t%*\\D%n:\ %m,%*[^\"]\"%f\"%*\\D%l:\ %m,%f(%l)\ :\ %m,%*[^\ ]\ %f\ %l:\ %m,%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,%f\|%l\|\ %m,%f(%l\\,%c):%m,%f:%l:%m,%f\|%l\|\ %m

function! AlignEquals()
ruby << EOF
lines = readlines

newindex = lines.collect { |line| line.index("=") }.max

puts lines.collect { |line|
    oldindex = line.index("=")
    line.sub("=", " "*(newindex-oldindex) + "=")
}.join("")
EOF
endfunction

function! GitBlame()
mark z
normal gg
let s:other = @%
vnew
execute "r!git blame " s:other
0
normal dd
silent %!cut -b'-58'
set scb
set nowrap
set nomodified
set readonly
normal l
set scb
set nowrap
unlet s:other
normal `z
endfunction
"}}}

"{{{ Source-code related auto-commands...
"if version >= 500
"augroup srcprog
"endif   " version
"
"  " Remove all srcprog auto-commands
"  au!
"
"  " When starting to edit a file:
"  "   For *.c and *.h files set formatting of comments and set C-indenting on.
"  "   For other files switch it off
"  "   Don't change the order, it's important that the line with * comes first.
"  autocmd BufRead * set formatoptions=tcql nocindent comments&
"
"  " For C/C++/Java source code and header files, use the "C" formating 
"  " options, "C"-style indentation, and ``mult-line'' comments start with
"  " ``/*'', have each additional line begin with ``*'', and end with
"  " ``*/'', e.g.
"  "     /*
"  "      * this is a comment block
"  "      */
"  " End-line comments use the ``//'' sequence, e.g.
"  "     // This is an end-of-line comment.
"  autocmd BufRead *.c,*.h,*.cpp,*.cxx,*.cc,*.tcc,*.java set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://,://:
"
"  " For Ruby source
"  autocmd BufRead *.rb set ts=2 noet

"if version >= 500
"augroup END
"endif   " version
"}}}

  "{{{ Misc stuff...  
  behave xterm                " mouse support
  set selectmode=mouse        " mouse support
  "}}}

"{{{ gzip-related auto-commands...
if version >= 500
augroup gzip
endif   " version
  " remove all gzip auto-commands
  au!

  " Enable editing of gzipped files
  "    read: set binary mode before reading the file
  "          uncompress text in buffer after reading
  "   write: compress file after writing
  "  append: uncompress file, append, compress file
  autocmd BufReadPre,FileReadPre      *.gz set bin
  autocmd BufReadPost,FileReadPost    *.gz let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost    *.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost    *.gz set nobin
  autocmd BufReadPost,FileReadPost    *.gz let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost    *.gz execute ":doautocmd BufReadPost " . expand("%:r")

  autocmd BufWritePost,FileWritePost  *.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost  *.gz !gzip <afile>:r

  autocmd FileAppendPre         *.gz !gunzip <afile>
  autocmd FileAppendPre         *.gz !mv <afile>:r <afile>
  autocmd FileAppendPost        *.gz !mv <afile> <afile>:r
  autocmd FileAppendPost        *.gz !gzip <afile>:r
if version >= 500
augroup END
endif   " version
"}}}

  "{{{ Esperanto
  digraph G^ 216
  digraph g^ 248
  digraph H^ 166
  digraph h^ 182
  digraph J^ 172
  digraph j^ 188
  digraph C^ 264
  digraph c^ 230
  digraph S^ 222
  digraph s^ 254
  digraph U^ 221
  digraph u^ 253
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

"{{{ Sarah's maps
map ,un yyp:s/./-/g:nohlsearch
map ,ve :e $VIM/_vimrc
map ,vu :source $VIM/_vimrc
"}}}

"{{{ Jimmy's maps
map ,i^ :s/^/ /
vmap ,i^ :s/^/ /
map ,xx :%!xxd:set nomod
vmap ,xx :!xxd
map ,av1 :g/^$/d:g^$/d:%s/\s*-\?\s*(.*$
map ,av2 :%s/^\d\+\./#
map ,bx yy2p:s/./ /g<CR>:s/^./<Bar><CR>:s/.$/<Bar><CR>,
vmap ,, :s/$/,<CR>gvJ$x
vmap ,! dO<!--<CR>--><ESC>P
vmap ,* dO/*<CR>*/<ESC>P
vmap ,# :s/^/#<CR>
vmap ,; :s/^/;<CR>
" Reformat ethereal data as XXD data
map ,xf :%s/^\([0-9a-fA-F]\{4\}\)  /000\1::%s/\([0-9a-fA-F]\{2\}\) \([0-9a-fA-F]\{2\}\)/\1\2/g
map ,cd :cd %:p:h
map ,vs :vsplit
map ,vf ,vsgf
map ,cc :s/^/\/\//
map ,cu :s/^\(\s*\)\/\//\1/
"map ,td :call Todo()
map ,td :r!date +\%Y-\%m-\%d\ \%a<CR>
map ,lg yypILOG(Trace, L"A");
map ,cw yyp:s/"/\\"/geIConsole.WriteLine("A");
map Y y$
vmap ,dc !dc<CR>
nmap ,dc V!dc<CR>
nmap ,gb :call GitBlame()<CR>

function! Todo()
   normal :vnew
   normal :r!rake todo
   normal gg2dd
   syntax match lccFilename /^[^:]\+/
   syntax keyword lccTodo TODO todo contained
   syntax match lccComment /\(TODO\|todo\).*$/ contains=lccTodo
   highlight lccFilename guifg='Blue'
   highlight lccTodo guibg='Yellow' guifg='Blue' gui=bold
   set nomodified
endfunction

function XmlEscape()
   normal :%s/&/\&amp;/g
   normal :%s/</\&lt;/g
   normal :%s/>/\&gt;/g
   normal :%s/"/\&quot;/g
endfunction

map <silent> <TAB> :call BufferList()<CR>
"}}}

"{{{ Misc
syn keyword cTodo contained TODO FIXME XXX \todo

set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set tags=tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags

"set tildeop
"}}}

"{{{ Temporary project related
function! ListSource(glob)
    execute "normal :r!dir /s /b " . a:glob . "<CR>"
endfunction

map ,so :!makesession.bat<CR>:e session<CR>
map ,se gg0dG:call ListSource("src\*.cs")<CR>ggdd
map ,sj gg0dG:r!dir /s /b com\*.java<CR>ggdd
map ,gd yyP:s/"/\\"/ge<CR>Ig_debug("<ESC>A");<ESC>
"}}}

" vim:foldmethod=marker
