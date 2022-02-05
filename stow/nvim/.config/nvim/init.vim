set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin(stdpath('data') . '/plugged')

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()


" Nvim specific config :

" Incremental commands
set icm=nosplit

" Briefly highlight yanked text
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}


source ~/.vimrc
