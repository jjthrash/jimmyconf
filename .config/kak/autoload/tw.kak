decl int textwidth 0

hook global BufSetOption textwidth=0 %{
}

hook global BufSetOption textwidth=[1-9]\d* %{
    hook window InsertKey [^\n] %{ try %{ exec -draft %rec{<a-h><a-k>[^\n]{%opt{textwidth},}<ret><a-space>bi<ret><esc>} } }
}
