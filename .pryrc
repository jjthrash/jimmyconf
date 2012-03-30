Pry::Commands.block_command "bt", "show a backtrace to give us some context" do
  begin
    raise "just looking"
  rescue => error
    output.puts error.backtrace
  end
end
# vim:ft=ruby
