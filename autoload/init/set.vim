let s:dirs = [
			\ $GITHUBWORKSPACE . '/' . split(system('git config --global user.name'))[0],
			\ $HOME . '/Desktop',
			\ $HOME . '/Documents',
			\ $HOME . '/README.md',
			\ $HOME . '/.vim/vimrc',
			\ $HOME . '/.vim/gvimrc',
			\ $XDG_CONFIG_HOME . '/nvim',
			\ $XDG_DATA_HOME . '/nvim',
			\ ]
function! init#set#main() "{{{
	for l:dir in s:dirs
		if stridx(expand('%:p'), expand(l:dir)) == 0
			if &filetype ==# 'pandoc'
				nnoremap <Buffer> dsc <Plug>(vimtex-cmd-delete)
				nnoremap <Buffer> dsd <Plug>(vimtex-delim-delete)
				nnoremap <Buffer> dse <Plug>(vimtex-env-delete)
			endif
			return l:dir
		endif
	endfor
	if filereadable(expand('%'))
		call init#map#main()
	endif
endfunction "}}}

