DIR = File.expand_path(File.dirname(__FILE__))

`ln -sf #{DIR}/.vimrc #{ENV['HOME']}`
`ln -sf #{DIR}/.vim #{ENV['HOME']}`
`ln -sf #{DIR}/bin #{ENV['HOME']}`
