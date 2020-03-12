if (expand('%:p:h') =~ substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~ substitute($GITWORKSPACE, '\', '\\\\', 'g')) && expand('%:p:h') !~ $USER
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
endif

if expand('%') == 'option-window'
	call init#map#main()
endif

if expand('%:p') == $MYVIMRC
	autocmd! BufWritePost $MYVIMRC source $MYVIMRC
	if has('win32')
		autocmd! BufWritePost $MYVIMRC AirlineRefresh
					\| AirlineRefresh
	endif
	autocmd! BufWritePost $MYVIMRC setlocal foldmethod=marker
				\| FullscreenStart
	setlocal path+=$GITHUBWORKSPACE
	setlocal iskeyword+=.,/,-
	nnoremap <buffer><silent> gd :execute 'edit '.$GITHUBWORKSPACE.'/'.expand('<cword>').'/doc/*.txt'<CR>
	nnoremap <buffer><silent> gD :execute 'edit '.$GITHUBWORKSPACE.'/'.expand('<cword>').'/README*'<CR>
	nnoremap <buffer><silent> <C-w>d :execute 'split '.$GITHUBWORKSPACE.'/'.expand('<cword>').'/doc/*.txt'<CR>
	nnoremap <buffer><silent> <C-w>D :execute 'split '.$GITHUBWORKSPACE.'/'.expand('<cword>').'/README*'<CR>
endif

if expand('%:p:h') == expand($VIMCONFIG.'/ftdetect')
	nnoremap <buffer> <LocalLeader>g :execute 'edit ' . $GITWORKSPACE . expand('/.cache/init.vim/.dein/ftdetect/ftdetect.vim')<CR>
endif

if expand('%:p') == expand($GITWORKSPACE.'/.cache/init.vim/.dein/ftdetect/ftdetect.vim')
	nnoremap <buffer> <LocalLeader>g :execute 'edit ' . $XDG_CONFIG_VIM . expand('/ftdetect/') . '*.vim'<CR>
endif

let g:browser_search_default_engine = 'github'

setlocal foldmethod=marker

omap <buffer> aL <Plug>(textobj-continuous-vim-a)
xmap <buffer> aL <Plug>(textobj-continuous-vim-a)
omap <buffer> iL <Plug>(textobj-continuous-vim-i)
xmap <buffer> iL <Plug>(textobj-continuous-vim-i)
nnoremap <buffer><silent> gs :<C-u>set operatorfunc=vim#source#main<CR>g@
nnoremap <buffer><silent> gss :<C-u>execute getline(line('.'))<CR>
xnoremap <buffer><silent> gs :<C-u>execute substitute(join(getline(line("'<"),line("'>")), "\n"), ' "[{}]\{3}', '', 'g')<CR>
nnoremap <buffer><silent> <LocalLeader>e yiW:echo <C-r>0<CR>
xnoremap <buffer><silent> <LocalLeader>e y:echo <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>E yiW:echom <C-r>0<CR>
xnoremap <buffer><silent> <LocalLeader>E y:echom <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>t yiw:set <C-r>0<CR>
xnoremap <buffer><silent> <LocalLeader>t y:set <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>i :highlight <C-r><C-w><CR>
xnoremap <buffer><silent> <LocalLeader>i y:highlight <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>s :echo has(expand("<cWORD>"))<CR>
xnoremap <buffer><silent> <LocalLeader>s y:echo has('<C-r>0')<CR>
nnoremap <buffer><silent> <LocalLeader>p :echo hasmapto(expand("<cWORD>"))<CR>
xnoremap <buffer><silent> <LocalLeader>p y:echo hasmapto('<C-r>0')<CR>
nnoremap <buffer><silent> <LocalLeader>P :echo mapcheck(expand("<cWORD>"))<CR>
xnoremap <buffer><silent> <LocalLeader>P y:echo mapcheck('<C-r>0')<CR>
xmap <buffer> af <Plug>(textobj-function-a)
xmap <buffer> if <Plug>(textobj-function-i)
xmap <buffer> aF <Plug>(textobj-function-A)
xmap <buffer> iF <Plug>(textobj-function-I)
omap <buffer> af <Plug>(textobj-function-a)
omap <buffer> if <Plug>(textobj-function-i)
omap <buffer> aF <Plug>(textobj-function-A)
omap <buffer> iF <Plug>(textobj-function-I)

