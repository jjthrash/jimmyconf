def -docstring 'create a new kak client for current session' \
    vnew %{ %sh{
            if [ $# -ne 0 ]; then kakoune_params="-e '$@'"; fi
            TMUX=`which tmux`
            daemonize $TMUX split-window -v "kak -c ${kak_session} ${kakoune_params}"
}}

def -docstring 'create a new kak client horizontally for current session' \
    new %{ %sh{
            if [ $# -ne 0]; then kakoune_params="-e '$@'"; fi
            TMUX=`which tmux`
            daemonize $TMUX split-window -h "kak -c ${kak_session} ${kakoune_params}"
}}
