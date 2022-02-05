" cspell: disable
" Plugins are managed by the Vundle plugin manager
" Assumes Vim 8.2 with featureset huge and python3 support
" Coc.nvim requires language servers that need to be installed separately

call plug#begin()

" Plugin manager
Plug 'VundleVim/Vundle.vim'

" Fancy status bar
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" Just the tabline for buffers without full airline
Plug 'ap/vim-buftabline'

" More syntax highlighting
" Plugin 'sheerun/vim-polyglot'

" 
" Plugin 'vim-python/python-syntax'

" Distraction free mode
" Plugin 'junegunn/goyo.vim'
" Plugin 'junegunn/limelight.vim'

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Auto-close brackets
Plug 'jiangmiao/auto-pairs'

" Snippets ( :CocInstall coc-snippets for coc support)
" Plugin 'SirVer/ultisnips'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Latex integration (Use :CocInstall coc-vimtex for Coc support)
Plug 'lervag/vimtex'

" File explorer
Plug 'preservim/nerdtree'

" Tag functions, objects, methods.. on the fly
Plug 'majutsushi/tagbar'

" Enhanced use of brackets other surrounding things
Plug 'tpope/vim-surround'

" Toggle comments for code
Plug 'preservim/nerdcommenter'

" Autocompletion, check doc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Semantic highlighting for C, check doc
" Plugin 'jackguo380/vim-lsp-cxx-highlight'

" Highlighting for C, check doc, has compiled component
" Plugin 'jeaye/color_coded'

" Fuzzy search files
" Plugin 'ctrlpvim/ctrlp.vim'

" Fuzzy find everything in vim
Plug 'junegunn/fzf.vim'

" Fancy icons (Needs specially patched nerd fonts)
Plug 'ryanoasis/vim-devicons'

" Neat integration with tmux
Plug 'christoomey/vim-tmux-navigator'

" Solarized colours
Plug 'altercation/vim-colors-solarized'

" Interact with tmux
Plug 'benmills/vimux'

" Ack searching from within vim
" Plugin 'mileszs/ack.vim'

" Cheap semi-semantic highlighting
Plug 'jaxbot/semantic-highlight.vim'

" Convert camel case + snake case, abolish typos, make substitutes easier
Plug 'tpope/vim-abolish'

" Pulse when moving to next search result
Plug 'inside/vim-search-pulse'

" Pretty Markdown preview in Browser
" Plugin 'iamcco/markdown-preview.nvim'

" Quick navigation by `f`-like searching
Plug 'justinmk/vim-sneak'

" Autoformatting, where Coc doesn't work
Plug 'Chiel92/vim-autoformat'

" Vimwiki
Plug 'vimwiki/vimwiki'

" Highlighting to improve navigation
Plug 'unblevable/quick-scope'

" Jupyter notebooks
" Plugin 'goerz/jupytext.vim'

" Multiple Cursors
" Plugin 'mg979/vim-visual-multi'

" Disable caching for editing pass files
Plug 'psliwka/vim-redact-pass'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" All Plugins must be added before the following line
call plug#end()            " required
