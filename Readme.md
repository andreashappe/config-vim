# Currently installed Plugins:

## using (as changes a bit of default behaviour)

* ag -- fast grep replacement, needs the_silver_searcher
* ctrlp.vim -- TextMate-like ctrl-t/p file switcher
* ultisnips & vim-snippets -- TextMate-like code snippets, needs python
* syntastic -- automatic syntax checking on save, can be CPU-heavy
* vim-airline -- nice statusbar, needs 256color terminal

## should be using (added, but not sure if I keep them)

* vim-surround -- for changing strings delimiters, etc.
* vim-fugitive -- for interacting with git
* vim-vroom
* vimux
* vim-bundler -- needed for vim-rails or vim-ruby-refactoring
* vim-rails -- lots of rails related stuff which I'm currenlty not really using
* vim-ruby-refactoring -- sounds interesting, haven't used it yet
* [vimtex](https://github.com/lervag/vimtex)
* grammarous

# Installation

* install the_silver_searcher (apt-get install / dnf install)
* install vundle

~~~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
~~~

* open vim
* :PluginInstall

# try stuff

* buffer explorer (<leader>be)
* "gc(c)" to comment out stuff
