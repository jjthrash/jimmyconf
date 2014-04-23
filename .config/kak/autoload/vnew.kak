def -docstring 'create a new kak client for current session' \
    -shell-params \
    vnew %{ %sh{
            if [ $# -ne 0 ]; then kakoune_params="-e '$@'"; fi
            TMUX=`which tmux`
            daemonize $TMUX split-window -v "kak -c ${kak_session} ${kakoune_params}"
}}
