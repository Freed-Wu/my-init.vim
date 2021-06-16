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

if expand('%:p') ==# $MYVIMRC
	call init#dein#main()
	let b:browser_search_default_engine = 'github'
endif

if &buftype ==# 'nofile'
	nnoremap <buffer><silent> <CR> <CR>
	nnoremap <buffer><silent> ZZ <C-c>
	nnoremap <buffer><silent> ZQ :<C-u>quit<CR>
endif

setlocal foldmethod=marker
setlocal makeprg=:source\ %

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
nnoremap <buffer><silent> g! :<C-u>set operatorfunc=vim#source#main<CR>g@
nnoremap <nowait><buffer> <LocalLeader> :call quickui#context#open(b:context, {})<CR>
xnoremap <nowait><buffer> <LocalLeader> :<C-u>call quickui#context#open(b:context_v, {})<CR>
let b:context = map([
			\ ['&Set', 'execute "set" substitute(expand("<cword>"), "''", "", "g") . "?"'],
			\ ['&Echo', 'execute "echo" substitute(expand("<cWORD>"), "|", "", "g")'],
			\ ['&Has', 'execute "echo" has(expand("<cword>"))'],
			\ ['&Autocmd', 'execute "autocmd" substitute(expand("<cWORD>"), "|", "", "g")'],
			\ ['H&ighlight', 'execute "highlight" expand("<cword>")'],
			\ ['&Map', 'execute "map" expand("<cWORD>")'],
			\ ['F&unction', 'execute "function" expand("<cword>")'],
			\ ['E&xecute', 'execute getline(line("."))'],
			\ ] , {_, v -> v + [get(v, 1)]})
let b:context_v = map([
			\ ['&Set', 'execute "set" substitute(getline(".")[col("v") - 1:col("''>") - 1], "''", "", "g") . "?"'],
			\ ['&Echo', 'execute "echo" substitute(getline(".")[col("v") - 1:col("''>") - 1], "|", "", "g")'],
			\ ['&Has', 'execute "echo" has(getline(".")[col("v") - 1:col("''>") - 1])'],
			\ ['&Autocmd', 'execute "autocmd" substitute(getline(".")[col("v") - 1:col("''>") - 1]), "|", "", "g")'],
			\ ['H&ighlight', 'execute "highlight" getline(".")[col("v") - 1:col("''>") - 1]'],
			\ ['&Map', 'execute "map" getline(".")[col("v") - 1:col("''>") - 1]'],
			\ ['F&unction', 'execute "function" getline(".")[col("v") - 1:col("''>") - 1]'],
			\ ['E&xecute', 'execute substitute(join(getline(line("v"),line("''>") - 1), "\n"), '' "[{}]\{3}'', '''', ''g'')'],
			\ ] , {_, v -> v + [get(v, 1)]})
