if (expand('%:p:h') =~# substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~# substitute($GITWORKSPACE, '\', '\\\\', 'g')) && expand('%:p:h') !~# $GITNAME
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
endif

if expand('%') ==# 'option-window'
	call init#map#main()
endif

if expand('%:p') ==# $MYVIMRC
	setlocal path+=$GITHUBWORKSPACE
	setlocal iskeyword+=.,/,-
	nnoremap <buffer><silent> gd :find $GITHUBWORKSPACE/<cword>/doc/*.txt<CR>
	nnoremap <buffer><silent> gD :find $GITHUBWORKSPACE/<cword>/README*<CR>
	nnoremap <buffer><silent> <C-w>d :sfind $GITHUBWORKSPACE/<cword>/doc/*.txt<CR>
	nnoremap <buffer><silent> <C-w>D :sfind $GITHUBWORKSPACE/<cword>/README*<CR>
endif

if expand('%:p:h') ==# expand($VIMCONFIG.'/ftdetect')
	nnoremap <buffer> <LocalLeader>g :execute 'edit ' . $GITWORKSPACE . expand('/.cache/init.vim/.dein/ftdetect/ftdetect.vim')<CR>
endif

if expand('%:p') ==# expand($GITWORKSPACE.'/.cache/init.vim/.dein/ftdetect/ftdetect.vim')
	nnoremap <buffer> <LocalLeader>g :execute 'edit ' . $XDG_CONFIG_VIM . expand('/ftdetect/') . '*.vim'<CR>
endif

let g:browser_search_default_engine = 'github'

setlocal foldmethod=marker

inoremap <nowait><buffer> & &
inoremap <nowait><buffer> < <
inoremap <nowait><buffer> > >
omap <buffer> aL <Plug>(textobj-continuous-vim-a)
xmap <buffer> aL <Plug>(textobj-continuous-vim-a)
omap <buffer> iL <Plug>(textobj-continuous-vim-i)
xmap <buffer> iL <Plug>(textobj-continuous-vim-i)
nnoremap <buffer><silent> gs :<C-u>set operatorfunc=vim#source#main<CR>g@
nnoremap <buffer><silent> gss :<C-u>execute getline(line('.'))<CR>
xnoremap <buffer><silent> gs :<C-u>execute substitute(join(getline(line("'<"),line("'>")), "\n"), ' "[{}]\{3}', '', 'g')<CR>
nnoremap <buffer><silent> <LocalLeader>e :<C-u>execute 'echo '.expand('<cWORD>')<CR>
xnoremap <buffer><silent> <LocalLeader>e y:echo <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>E :<C-u>execute 'echomsg '.expand('<cWORD>')<CR>
xnoremap <buffer><silent> <LocalLeader>E y:echomsg <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>t :<C-u>set <C-r><C-w><CR>
xnoremap <buffer><silent> <LocalLeader>t y:set <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>i :<C-u>highlight <C-r><C-w><CR>
xnoremap <buffer><silent> <LocalLeader>i y:highlight <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>s :<C-u>echo has(expand("<cWORD>"))<CR>
xnoremap <buffer><silent> <LocalLeader>s y:echo has('<C-r>0')<CR>
nnoremap <buffer><silent> <LocalLeader>p :<C-u>echo hasmapto(expand("<cWORD>"))<CR>
xnoremap <buffer><silent> <LocalLeader>p y:echo hasmapto('<C-r>0')<CR>
nnoremap <buffer><silent> <LocalLeader>P :<C-u>echo mapcheck(expand("<cWORD>"))<CR>
xnoremap <buffer><silent> <LocalLeader>P y:echo mapcheck('<C-r>0')<CR>
xmap <buffer> af <Plug>(textobj-function-a)
xmap <buffer> if <Plug>(textobj-function-i)
xmap <buffer> aF <Plug>(textobj-function-A)
xmap <buffer> iF <Plug>(textobj-function-I)
omap <buffer> af <Plug>(textobj-function-a)
omap <buffer> if <Plug>(textobj-function-i)
omap <buffer> aF <Plug>(textobj-function-A)
omap <buffer> iF <Plug>(textobj-function-I)

