"= USAGE =======================================================================
"= Put this file into you ~/.vim/plugin directory and set up up like this in   =
"= your ~/.vimrc:                                                              =
"=                                                                             =
"= NEEDED:                                                                     =
"=     map <leader>gb :call GitBlame()<CR>                                     =
"===============================================================================

if exists('g:gitstuffloaded')
  finish
endif
let g:gitstuffloaded = 1

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
