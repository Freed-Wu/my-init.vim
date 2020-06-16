let b:fswitchdst = 'vim'
if expand('%:p:h:t') ==# 'ftplugin'
	let b:fswitchlocs = 'syntax'
elseif expand('%:p:h:t') ==# 'syntax'
	let b:fswitchlocs = 'ftplugin'
elseif expand('%:p:h:t') ==# 'plugin'
	let b:fswitchlocs = 'autoload'
elseif expand('%:p:h:t') ==# 'autoload'
	let b:fswitchlocs = 'plugin'
elseif expand('%:p:h:t') ==# 'themes'
	let b:fswitchlocs = $GITHUBWORKSPACE . '/flazz/vim-colorschemes/colors,' . $VIMRUNTIME . '/colors'
elseif expand('%:p:h:t') ==# 'colors'
	let b:fswitchlocs = $GITHUBWORKSPACE . '/vim-airline/vim-airline-themes/autoload/airline/themes'
endif

if expand('%') ==# 'option-window'
	call init#map#main()
endif

if expand('%:p') ==# $MYVIMRC
	call init#dein#main()
	let b:browser_search_default_engine = 'github'
endif

if &buftype ==# 'nofile'
	nnoremap <buffer><silent> <CR> <CR>
	nnoremap <buffer><silent> ZZ <C-c>
	nnoremap <buffer><silent> ZQ :<C-u>quit<CR>
endif

call vim#map#main()
call init#set#main()

setlocal foldmethod=marker

execute 'nnoremap <buffer> <LocalLeader>lF :<C-u>Leaderf file '.$VIM.' --input=.vim<CR>'
execute 'nnoremap <buffer> <LocalLeader>lc :<C-u>Leaderf file '.$VIMCONFIG.' --input=.vim<CR>'
execute 'nnoremap <buffer> <LocalLeader>ld :<C-u>Leaderf file '.$VIMDATA.' --input=.vim<CR>'
execute 'nnoremap <buffer> <LocalLeader>lr :<C-u>Leaderf file '.$GITHUBWORKSPACE.' --input=.vim<CR>'
execute 'nnoremap <buffer> <LocalLeader>lf :<C-u>Leaderf file '.$GITWORKSPACE.'/.cache/ --input=.vim<CR>'
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
nnoremap <buffer><silent> <LocalLeader>l :<C-u>set operatorfunc=vim#source#main<CR>g@
nnoremap <buffer><silent> <LocalLeader>ll :<C-u>execute getline(line('.'))<CR>
xnoremap <buffer><silent> <LocalLeader>ll :<C-u>execute substitute(join(getline(line("'<"),line("'>")), "\n"), ' "[{}]\{3}', '', 'g')<CR>

