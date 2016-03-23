def -allow-override match_html %{
  %sh{
    echo "echo $kak_selections_desc"
  }
}
