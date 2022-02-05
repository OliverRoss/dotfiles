" cspell: disable
"-------------------------------------------------- Autocommands 

augroup update_after_config_change
	autocmd!
	autocmd BufWritePost **/i3/config :silent exec "!i3-msg restart"
	autocmd BufWritePost polybar.conf :silent exec "!i3-msg restart"
	autocmd BufWritePost **/my_vim_config/*.vim :so $MYVIMRC
	autocmd BufWritePost .vimrc :so $MYVIMRC
augroup END


augroup change_pwd_for_config
	autocmd!
	autocmd BufReadPost .vimrc :cd ~/.dotfiles
	autocmd BufDelete .vimrc :cd-
augroup END

" Compile and view Latex automatically
" TODO: Delete this when project is done
augroup compile_latex
	autocmd!
	autocmd BufReadPost main.tex call VimMainTex()
	function VimMainTex()
		VimtexCompile
		VimtexView
		silent !i3-msg resize shrink left 45; i3-msg focus left; xdotool key 2 4 j
		GitGutterDisable
	endfunction
augroup END

" TODO: Delete this when project is done
augroup tikz_compile
	autocmd!
	autocmd BufWritePost *.tikz call CompileTikzPreview()
	function CompileTikzPreview()
				silent !preview/preview_image.sh %;
				silent !i3-msg focus right
				silent !xdotool key a
				silent !i3-msg focus left
				redraw!
	endfunction
augroup END

augroup formatting
	autocmd!
	" This is vim-autoformat (Uses latexindent.pl)
	autocmd BufWritePost *.tex :silent Autoformat
	" This is Coc
	autocmd BufWritePost * :silent Format
augroup END

" Filetypes
augroup filetypes
	autocmd BufNewFile,BufRead *.tikz set syntax=tex
augroup END

" Removes cursorline when inserting text
augroup mode_indicator
	autocmd InsertEnter * :set nocursorline
	autocmd InsertLeave * :set cursorline
augroup END
