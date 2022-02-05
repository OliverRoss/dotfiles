" cSpell:disable
" ---------------------------------------------------------- Mappings

" Increment
nnoremap <C-y> <C-a>

" Vimwiki
let g:vimwiki_key_mappings = { 'all_maps': 0, }
nmap <leader>s <Plug>VimwikiIndex
nmap <leader>f <Plug>VimwikiFollowLink

" fzf.vim
nnoremap <leader>/ :History/<CR>
nnoremap <leader>: :History:<CR>
nnoremap <leader>h :Helptags<CR>
nnoremap <leader>b :BLines<CR>
" nnoremap <leader>s :Lines<CR>
nnoremap <leader>c :Commands<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>o :Files<CR>
nnoremap <space>p :Tags<CR>
inoremap <expr> **<tab> fzf#vim#complete#path('fd')

" Generate tags
" nnoremap <leader>t :silent !ctags -R .<CR>:so $MYVIMRC<CR>

" Goyo (Zen mode)
" nnoremap <leader>z :Goyo<CR>

" Quickfix list
nnoremap <leader>j :cnext<CR>zz
nnoremap <leader>k :cprevious<CR>zz

" German keyboard mappings
map Ö 0 
map ö $
nnoremap <C-i> <C-]>

" Tags, Nerdtree, and ctrl p
" Files Fuzzy search
" let g:ctrlp_map = '<space-o>'
" nnoremap <silent><space>o :CtrlP<CR>
" nnoremap <silent><space>p :CtrlPTag<CR>
" Tags overview
nnoremap <silent><C-p> :TagbarToggle<CR>
let g:tagbar_map_close = "<C-p>"

" Vimtex TODO: Only a dirty hack
function VimtexForwardSearch()
	VimtexView
	silent !sleep 1
	silent !i3-msg focus left
	redraw!
endfunction

nnoremap <leader>tc :VimtexCompile<CR>
" nnoremap <leader>tv :VimtexView<CR>
" TODO: restore this^
nnoremap <leader>tv :call VimtexForwardSearch()<CR>
nnoremap <leader>ts :VimtexStatus<CR>
nnoremap <leader>te :VimtexErrors<CR>
nnoremap <leader>tt :VimtexTocToggle<CR>

" Toggle displaying of control characters 
nnoremap <silent><leader>l :set list!<CR>
" Toggle displaying of line numbers 
nnoremap <silent><leader>u :set number!<CR> :set relativenumber!<CR>

" Git commands
nnoremap <silent><leader>gi :Gstatus<CR>

" Gitgutter commands
nnoremap <silent><leader>gn :GitGutterNextHunk<CR>
nnoremap <silent><leader>gp :GitGutterPrevHunk<CR>
nnoremap <silent><leader>gs :GitGutterStageHunk<CR>
nnoremap <silent><leader>gS :Gwrite<CR>
nnoremap <silent><leader>gu :GitGutterUndoHunk<CR>
nnoremap <silent><leader>gg :GitGutterToggle<CR>

" center view on the search result
nmap n nzz<Plug>Pulse
nmap N Nzz<Plug>Pulse
nmap * *zz<Plug>Pulse
nmap # #zz<Plug>Pulse

nnoremap <silent><leader>ev :e $MYVIMRC<CR>
" nnoremap <silent><leader>sv :so $MYVIMRC<CR>
" Activate this option when using Airline instead
" nnoremap <silent><leader>sv :so $MYVIMRC<CR>:AirlineRefresh<CR>

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
nnoremap <leader>Q :wq<CR>

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

" Toggle Nerdtree plugin for fileviewer
nnoremap <silent><C-o> :NERDTreeToggle <CR>
inoremap <silent><C-o> <Esc> :NERDTreeToggle <CR>
vnoremap <silent><C-o> <Esc> :NERDTreeToggle <CR>

" Vimux mappings
nnoremap <silent><Leader>vp :VimuxPromptCommand("clear; ")<CR>
nnoremap <silent><Leader>P :call VimuxRunCommandInDir("clear; python3",1)<CR>
nnoremap <silent><Leader>vl :VimuxRunLastCommand<CR>
nnoremap <silent><Leader>vo :VimuxOpenRunner<CR>
nnoremap <silent><leader>vc :call VimuxRunCommand("clear")<CR>

" Ack plugin (uses silver searcher under the hood)
" nnoremap <Leader>a :Ack!<Space>''<Left>

" Ag/ Silversearcher with fzf (needs fzf.vim)
nnoremap <Leader>a :Ag<Space>

" fun! ReadMan()
"   " Assign current word under cursor to a script variable:
"   let s:man_word = expand('<cword>')
"   " Open a new buffer:
"   :exe ":e" s:man_word
"   " Read in the manpage for man_word (col -b is for formatting):
"   :exe ":r!man " . s:man_word . " | col -b"
"   " Goto first line...
"   :exe ":goto"
"   " and delete it:
"   :exe ":delete"
" endfun

" Map the K key to the ReadMan function: ls
" map K :call ReadMan()<CR>"

" ---------------------------------------------------------- CoC Config
" TextEdit might fail if hidden is not set. (Already set, but kept here
" so that the CoC Config stays self-contained)
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages (same as set hidden, already set)
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
