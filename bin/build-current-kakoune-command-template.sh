#!/usr/bin/env ruby

puts "start"
puts `tmux list-sessions`
puts $?
puts "finish"
#exit 0

#session = `tmux list-sessions | awk 'BEGIN { FS=":" } /attached/ { print $1 }'`
#puts session
#exit 1 if session == ''
#
#window = `tmux list-windows -t #{session}`.split(/\n/).grep(/\(active\)$/)[0].split[-2]
#puts window
#
#pane = `tmux list-panes -t #{window} -F "#\{?pane_active,active,}|#T" | ag '^active'`
#puts pane
#exit 1 unless pane =~ / - Kakoune/
#
#pane =~ /(\S+)@\[(\S+)\] - Kakoune/
#
##puts "echo eval -client #{$1} %{ exec %{ REPLACEME } } | kak -p #{$2}"
#puts [$1,$2].join("@")
