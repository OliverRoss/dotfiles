" ---------------------------------------------------------- Vim Config

" Relative line numbers
" set number
" set relativenumber

" Syntax highlighting
syntax on

" Maximize help window automatically
" set helpheight=80

set nocompatible

" For fancy icons
set encoding=UTF-8

" Always show the sign column (used by gitgutter and coc.nvim)
set signcolumn=yes

" Ask if vim should save the file
set confirm

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue"
set cmdheight=2

" Wrap lines and show a coloured border column
set wrap
set textwidth=80
set colorcolumn=81

" Highlight search results
set hlsearch

" Only show statusbar when necessary
set laststatus=1

" Clear search buffer to remove the search highlights
noremap <silent> <CR> :nohlsearch <CR>

" Show search matches while typing
set incsearch
" Default to case insensitive search
set ignorecase

" Configure tabs
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab

" Allow buffers to be hidden <- Why?
set hidden

" Change mapleader to ","
let mapleader=","

" Many undo levels
set undolevels=1000

" Don't beep
set noerrorbells

" Automatically indent newlines
set autoindent

" Display line where the cursor is at
set cursorline

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Handler to use when opening links
let g:netrw_browsex_viewer= "xdg-open"
let g:netrw_http_cmd="firefox"

" Different cursor for insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"

if exists('g:started_by_firenvim')
    set background=light 
endif

