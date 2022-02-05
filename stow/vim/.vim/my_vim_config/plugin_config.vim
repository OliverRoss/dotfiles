" cspell: disable
" ---------------------------------------------------------- Plugins Config

" || python-syntax: ||
let g:python_highlight_all=1

" || Quickscope: ||
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" || Vimwiki: ||
let wiki_main = {}
let wiki_main.path = '~/Oliver/Dokumente/Notizen'
let wiki_main.path_html = '~/Oliver/Dokumente/Notizen_html'
let wiki_main.syntax = 'markdown'
let wiki_main.ext = '.md'
let wiki_main.links_space_char = '_'
let wiki_infosec = {}
let wiki_infosec.path = '~/Oliver/Studium/Master_Informatik/master/notes'
let wiki_infosec.path_html = '/tmp/notes_html'
let wiki_infosec.syntax = 'markdown'
let wiki_infosec.ext = '.md'
let wiki_infosec.links_space_char = '_'
let g:vimwiki_list = [wiki_main,wiki_infosec]
let g:vimwiki_auto_header = 1 


" || Goyo: ||
" Add Tmux support and integrate Limelight(comment out for that)
function! s:goyo_enter()
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status off
		silent !tmux list-panes -F '\#F' | grep -q Z || tmux
		resize-pane -Z
	endif
	if executable('i3-msg')
		silent !i3-msg fullscreen toggle 
	endif
	set noshowmode
	set noshowcmd
	set scrolloff=999
	" Limelight
	" ...
endfunction

function! s:goyo_leave()
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status on
		silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	endif
	if executable('i3-msg')
		silent !i3-msg fullscreen toggle 
	endif
	set showmode
	set showcmd
	set scrolloff=5
	" Limelight!
	" ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" || Limelight: ||
" Dim colour for solarized 
" let g:limelight_conceal_ctermfg = '0'

" || Pulse: ||
	let g:vim_search_pulse_disable_auto_mappings = 1

" || Buftabline: ||

	let g:buftabline_show = 2
	let g:buftabline_indicators = 1 
	let g:buftabline_plug_max = 0


" || MarkdownPreview: ||
    " set to 1, the nvim will auto close current preview window when change
    " from markdown buffer to another buffer
    let g:mkdp_auto_close = 0

" || CtrlP: ||
" Add support for fuzzy-searching lines
    let g:ctrlp_extensions = ['line']

" || fzf: ||
    source /home/oliver/.fzf/plugin/fzf.vim
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9  }  }
    let g:fzf_colors = 
      \{ 'preview-bg':      ['bg', 'CursorLine'], 
      \ 'bg':      ['bg', 'CursorLine'] }
    let g:fzf_tags_command = 'ctags-universal -R'

" || Ack plugin: ||
    if executable('ag')
      " Use ag over grep for Ack plugin
      let g:ackprg = 'ag --vimgrep'
    
      " Use ag in CtrlP for listing files. Fast and respects .gitignore
      let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
    
      " ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0

    endif

" || Tagbar: ||
    let g:tagbar_autofocus = 1
    let g:tagbar_ctags_bin = '/usr/bin/ctags-universal'



" || GitGutter: ||
    " Change symbol for edited line
    let g:gitgutter_sign_modified = 'C'
    let g:gitgutter_enabled = 0



" || NERDTree: ||
    " Show on the right side of the screen
    :let g:NERDTreeWinPos = "right"
    " Fix weird displaying bug
    :let g:NERDTreeNodeDelimiter = "\u00a0"
    " Let window be only for Nerdtree and no other buffers
    augroup NerdTreeNoToggle
                    autocmd!
                    autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
    augroup END
    :let g:NERDTreeQuitOnOpen=1

" || Vimtex:||
    " Use mupdf for vimtex output and tell vim I'm using latex
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_view_automatic = 0
    let g:vimtex_view_forward_search_on_start = 0
    " autoformat
    let g:vimtex_format_enabled = 1
    let g:vimtex_indent_enabled = 1
    let g:tex_flavor = "latex"
    let g:vimtex_quickfix_mode=0
    set conceallevel=0
    let g:tex_conceal='abdmg'
    let g:vimtex_compiler_latexmk = {
              \ 'build_dir' : 'aux',
              \ 'callback' : 1,
              \ 'continuous' : 1,
              \ 'executable' : 'latexmk',
              \ 'hooks' : [],
	      \ 'options' : [
              \   '-verbose',
              \   '-file-line-error',
              \   '-synctex=1',
              \   '-interaction=nonstopmode',
              \ ],
              \}

" || vim-autoformat:||
    let g:autoformat_verbosemode=0
    let g:formatdef_my_custom_tex = '"latexindent -m"'
    let g:formatters_tex = ['my_custom_tex']

" || Ultisnips:||
    " Currently handled by Coc
    " let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.dotfiles/snippets"
    " " :UltiSnipsEdit split window.
    " let g:UltiSnipsEditSplit="vertical"
    " let g:UltiSnipsExpandTrigger="<tab>"
    " let g:UltiSnipsListSnippets="<c-tab>"
    " let g:UltiSnipsJumpForwardTrigger="<c-j>"
    " let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" || coc-snippets:||
    let g:coc_snippet_next = '<tab>'
    command EditSnippets CocCommand snippets.editSnippets

" || NERDCommenter:||
    " Use // for C comments that are toggled by NERDCommenter
    let g:NERDCustomDelimiters = { 'c': { 'left':'//','right':''}}
    let g:NERDCustomDelimiters = { 'tikz': { 'left':'%','right':''}}
    " Add space after comment delimiter
    let g:NERDSpaceDelims = 1
    " Align line-wise comment delimiters flush left instead of following code 
    " indentation
    let g:NERDDefaultAlign = 'left'
    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1

" || Termdebug (built-in) ||
    " Start debugger in a vertical split setup
    packadd termdebug
    let g:termdebug_wide = 163

" || vim-lsp-cww-highlight ||
    let g:lsp_cxx_hl_use_text_props = 0

" || vimux ||
    let g:VimuxOrientation = "h"

