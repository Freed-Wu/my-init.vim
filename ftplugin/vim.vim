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
	nnoremap <buffer><silent> gd :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/doc/*.txt'<CR>
	nnoremap <buffer><silent> gD :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/README*'<CR>
	nnoremap <buffer><silent> <C-w>d :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/doc/*.txt'<CR>
	nnoremap <buffer><silent> <C-w>D :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/README*'<CR>
	nnoremap <buffer><silent> <C-w>i :<C-u>execute 'Defx ' . $GITHUBWORKSPACE . '/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0]<CR>
endif

if &buftype ==# 'nofile'
	nnoremap <buffer><silent> <CR> <CR>
	nnoremap <buffer><silent> ZZ <C-c>
	nnoremap <buffer><silent> ZQ :<C-u>quit<CR>
endif

call vim#map#main()

setlocal foldmethod=marker

execute 'nnoremap <buffer> <LocalLeader>lF :<C-u>Leaderf file '.$VIM.' --input=.vim<CR>'
execute 'nnoremap <buffer> <LocalLeader>lc :<C-u>Leaderf file '.$VIMCONFIG.' --input=.vim<CR>'
execute 'nnoremap <buffer> <LocalLeader>ld :<C-u>Leaderf file '.$VIMDATA.' --input=.vim<CR>'
execute 'nnoremap <buffer> <LocalLeader>lr :<C-u>Leaderf file '.$GITHUBWORKSPACE.' --input=.vim<CR>'
execute 'nnoremap <buffer> <LocalLeader>lf :<C-u>Leaderf file '.$GITWORKSPACE.'/.cache/ --input=.vim<CR>'
inoremap <nowait><buffer> & &
inoremap <nowait><buffer> < <
inoremap <nowait><buffer> > >
omap <buffer> aL <Plug>(textobj-continuous-vim-a)
xmap <buffer> aL <Plug>(textobj-continuous-vim-a)
omap <buffer> iL <Plug>(textobj-continuous-vim-i)
xmap <buffer> iL <Plug>(textobj-continuous-vim-i)
xmap <buffer> af <Plug>(textobj-function-a)
xmap <buffer> if <Plug>(textobj-function-i)
xmap <buffer> aF <Plug>(textobj-function-A)
xmap <buffer> iF <Plug>(textobj-function-I)
omap <buffer> af <Plug>(textobj-function-a)
omap <buffer> if <Plug>(textobj-function-i)
omap <buffer> aF <Plug>(textobj-function-A)
omap <buffer> iF <Plug>(textobj-function-I)
nnoremap <buffer><silent> gs :<C-u>set operatorfunc=vim#source#main<CR>g@
nnoremap <buffer><silent> gss :<C-u>execute getline(line('.'))<CR>
xnoremap <buffer><silent> gs :<C-u>execute substitute(join(getline(line("'<"),line("'>")), "\n"), ' "[{}]\{3}', '', 'g')<CR>

