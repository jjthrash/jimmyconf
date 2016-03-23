decl bool expandtab false

hook global WinSetOption expandtab=true %{
  hook window InsertChar \t -group expandtab %{ exec -draft <left>@ }
}

hook global WinSetOption expandtab=false %{
  rmhooks window expandtab
}

