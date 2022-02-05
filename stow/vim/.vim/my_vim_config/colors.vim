" ---------------------------------------------------------- Colour Config

function! CocHighlights() abort
    " highlight CocErrorVirtualText ctermbg=4
    " highlight CocWarningVirtualText ctermbg=4
    " highlight CocInfoVirtualText ctermbg=4
    " highlight CocErrorSign ctermfg=125
    " highlight CocWarningSign ctermfg=10
    " highlight CocInfoSign ctermfg=10
    " highlight CocErrorHighlight ctermbg=12*
    " highlight CocWarningHighlight ctermbg=2*
    " highlight CocInfoHighlight ctermbg=2*
    " highlight CocFloating ctermbg=16*
endfunction

function! GitHighlights() abort

    let g:gitgutter_set_sign_background = 1
    highlight SignColumn ctermbg=NONE
    let g:gitgutter_sign_allow_clobber = 0
    " solarized (degraded)
    highlight GitGutterAdd ctermfg=64 cterm=bold ctermbg=NONE
    highlight GitGutterChange ctermfg=33 cterm=bold ctermbg=NONE
    highlight GitGutterDelete ctermfg=125 cterm=bold ctermbg=NONE

endfunction

function! MyHighlights() abort

    highlight CursorLineNr cterm=NONE
    highlight Folded cterm=NONE ctermfg=DarkBlue ctermbg=NONE
    highlight BufTabLineModifiedCurrent ctermfg=136 cterm=underline,bold
    " Hide ~ after end of buffer
    " hi! EndOfBuffer ctermbg=bg ctermfg=bg
    highlight VertSplit ctermbg=black
    highlight StatusLine ctermfg=DarkBlue
    highlight StatusLineNC ctermfg=black
    " Latex envs and matching paranthesis
    highlight MatchParen term=bold cterm=bold ctermfg=1 ctermbg=7*
    " split windows
    set fillchars=vert:\│
    " Man page coloring
    highlight manOptionDesc ctermfg=1 cterm=bold
    highlight manLongOptionDesc ctermfg=1 cterm=bold
    highlight manSectionHeading ctermfg=13 cterm=bold
    highlight texStyleBoth cterm=bold
    highlight texStyleItal  cterm=bold
    highlight BufTabLineFill ctermbg=8 cterm=underline
    highlight BufTabLineHidden ctermbg=8 cterm=underline
    highlight BufTabLineActive ctermbg=8 cterm=underline
    " highlight BufTabLineCurrent ctermbg=8 ct

endfunction

function! HighlightGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Load my colours after loading colorscheme -> doesn't work, why?
augroup MyColors
    autocmd!
    autocmd Colorscheme * call CocHighlights()
    autocmd Colorscheme * call GitHighlights()
    autocmd Colorscheme * call MyHighlights()
augroup END

" Set some stuff so that tmux displays vim colours correctly
colorscheme solarized
set background=dark
set t_Co=256

" Fixes weird autocmd failure on reloading vimrc
call GitHighlights()
call MyHighlights()
call CocHighlights()

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

