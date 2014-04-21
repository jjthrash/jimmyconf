decl bool expandtab no

hook global WinSetOption expandtab=true %[
    hook global InsertChar \t %{ exec -draft h@ }
]
