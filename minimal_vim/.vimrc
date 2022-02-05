" cspell: disable
"-------------------------------------------------- Autocommands 

" Removes cursorline when inserting text
augroup mode_indicator
	autocmd InsertEnter * :set nocursorline
	autocmd InsertLeave * :set cursorline
augroup END
" ---------------------------------------------------------- Colour Config

function! MyHighlights() abort

    highlight CursorLineNr cterm=NONE
    highlight Folded cterm=NONE ctermfg=DarkBlue ctermbg=NONE
    " Hide ~ after end of buffer
    " hi! EndOfBuffer ctermbg=bg ctermfg=bg
    highlight VertSplit ctermbg=black
    highlight StatusLine ctermfg=DarkBlue
    highlight StatusLineNC ctermfg=black
    " Latex envs and matching paranthesis
    highlight MatchParen term=bold cterm=bold ctermfg=1 ctermbg=7*
    " split windows
    set fillchars=vert:\│

endfunction

function! HighlightGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Load my colours after loading colorscheme -> doesn't work, why?
augroup MyColors
    autocmd!
    autocmd Colorscheme * call MyHighlights()
augroup END

" Set some stuff so that tmux displays vim colours correctly
set background=dark
set t_Co=256

" Fixes weird autocmd failure on reloading vimrc
call MyHighlights()

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

" cSpell:disable
" ---------------------------------------------------------- Mappings

" Increment
nnoremap <C-y> <C-a>

" Quickfix list
nnoremap <leader>j :cnext<CR>zz
nnoremap <leader>k :cprevious<CR>zz

" German keyboard mappings
map Ö 0 
map ö $
nnoremap <C-i> <C-]>

" Toggle displaying of control characters 
nnoremap <silent><leader>l :set list!<CR>
" Toggle displaying of line numbers 
nnoremap <silent><leader>u :set number!<CR> :set relativenumber!<CR>

" Switch between buffers
nnoremap <silent><leader>p :bp<CR>
nnoremap <silent><leader>n :bn<CR>
" Delete buffer
nnoremap <silent><leader>d :bd<CR>
" Reload buffer
nnoremap <silent><leader>e :e<CR>
" Save buffer to file
nnoremap <silent><leader>w :w<CR>
" Close window
nnoremap <leader>q :q<CR>

" Navigate around split windows without hitting <C-w>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" nnoremap <C-n> <C-w>v

" Escape with jf,fj because it's easier than ESC
inoremap jk <ESC>
inoremap kj <ESC>
inoremap <ESC> <nop>

" Write to file that requires sudo with w!!
cmap w!! w !sudo tee % >/dev/null

" Don't jump over wrapped lines
nnoremap j gj
nnoremap k gk

" Disable help messages from vim if F1 is pressed
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

" Try to speed up startup time by reducing buffer size
:set viminfo='20,<50,s10
