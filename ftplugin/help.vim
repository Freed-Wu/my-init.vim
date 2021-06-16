setlocal path=.,,$VIMRUNTIME/doc
setlocal iskeyword=!-~,^*,^\|,^\"
setlocal nonumber
setlocal norelativenumber
setlocal concealcursor=
setlocal buftype=help
setlocal formatexpr=bucky#md#format()
setlocal foldmethod=expr
if &buftype !=# 'help'
	setlocal foldlevel=99
endif

xmap <buffer> [[ <Plug>(textobj-help-link-p)
xmap <buffer> ]] <Plug>(textobj-help-link-n)
xmap <buffer> [] <Plug>(textobj-help-link-P)
xmap <buffer> ][ <Plug>(textobj-help-link-N)
xmap <buffer> [m <Plug>(textobj-help-option-p)
xmap <buffer> ]m <Plug>(textobj-help-option-n)
xmap <buffer> [M <Plug>(textobj-help-option-P)
xmap <buffer> ]M <Plug>(textobj-help-option-N)
xmap <buffer> [/ <Plug>(textobj-help-any-p)
xmap <buffer> ]/ <Plug>(textobj-help-any-n)
xmap <buffer> [/ <Plug>(textobj-help-any-P)
xmap <buffer> ]/ <Plug>(textobj-help-any-N)
omap <buffer> [[ <Plug>(textobj-help-link-p)
omap <buffer> ]] <Plug>(textobj-help-link-n)
omap <buffer> [] <Plug>(textobj-help-link-P)
omap <buffer> ][ <Plug>(textobj-help-link-N)
omap <buffer> [m <Plug>(textobj-help-option-p)
omap <buffer> ]m <Plug>(textobj-help-option-n)
omap <buffer> [M <Plug>(textobj-help-option-P)
omap <buffer> ]M <Plug>(textobj-help-option-N)
omap <buffer> [/ <Plug>(textobj-help-any-p)
omap <buffer> ]/ <Plug>(textobj-help-any-n)
omap <buffer> [/ <Plug>(textobj-help-any-P)
omap <buffer> ]/ <Plug>(textobj-help-any-N)
nmap <buffer> [[ <Plug>(textobj-help-link-p)
nmap <buffer> ]] <Plug>(textobj-help-link-n)
nmap <buffer> [] <Plug>(textobj-help-link-P)
nmap <buffer> ][ <Plug>(textobj-help-link-N)
nmap <buffer> [m <Plug>(textobj-help-option-p)
nmap <buffer> ]m <Plug>(textobj-help-option-n)
nmap <buffer> [M <Plug>(textobj-help-option-P)
nmap <buffer> ]M <Plug>(textobj-help-option-N)
nmap <buffer> [/ <Plug>(textobj-help-any-p)
nmap <buffer> ]/ <Plug>(textobj-help-any-n)
nmap <buffer> [/ <Plug>(textobj-help-any-P)
nmap <buffer> ]/ <Plug>(textobj-help-any-N)
nnoremap <nowait><buffer> <LocalLeader> :call quickui#context#open(b:context, {})<CR>
xnoremap <nowait><buffer> <LocalLeader> :<C-u>call quickui#context#open(b:context_v, {})<CR>
let b:context = [
			\ ['&Set', 'execute "set" substitute(expand("<cword>"), "''", "", "g") . "?"'],
			\ ['&Echo', 'execute "echo" substitute(expand("<cWORD>"), "|", "", "g")'],
			\ ['&Has', 'execute "echo" has(expand("<cword>"))'],
			\ ['&Autocmd', 'execute "autocmd" substitute(expand("<cWORD>"), "|", "", "g")'],
			\ ['&Map', 'execute "map" expand("<cWORD>")'],
			\ ['H&ighlight', 'execute "highlight" expand("<cword>")'],
			\ ['F&unction', 'execute "function" expand("<cword>")'],
			\ ['E&xecute', 'execute getline(line("."))'],
			\ ['--', ''],
			\ ['&Toilet', '.!toilet'],
			\ ['&Figlet', '.!figlet'],
			\ ['&CommentBanner', 'CommentBanner --pattern -,1,-'],
			\ ]
let b:context_v = [
			\ ['&Set', 'execute "set" substitute(getline(".")[col("v") - 1:col("''>") - 1], "''", "", "g") . "?"'],
			\ ['&Echo', 'execute "echo" substitute(getline(".")[col("v") - 1:col("''>") - 1], "|", "", "g")'],
			\ ['&Autocmd', 'execute "autocmd" substitute(getline(".")[col("v") - 1:col("''>") - 1]), "|", "", "g")'],
			\ ['&Has', 'execute "echo" has(getline(".")[col("v") - 1:col("''>") - 1])'],
			\ ['H&ighlight', 'execute "highlight" getline(".")[col("v") - 1:col("''>") - 1]'],
			\ ['&Map', 'execute "map" getline(".")[col("v") - 1:col("''>") - 1]'],
			\ ['F&unction', 'execute "function" getline(".")[col("v") - 1:col("''>") - 1]'],
			\ ['E&xecute', 'execute substitute(join(getline(line("''<"),line("''>") - 1), "\n"), '' "[{}]\{3}'', '''', ''g'')'],
			\ ['--', ''],
			\ ['&Toilet', '*!toilet'],
			\ ['&Figlet', '*!figlet'],
			\ ['&CommentBanner', 'CommentBanner --pattern -,1,-'],
			\ ]
augroup init_keyword "{{{
	autocmd!
	autocmd CmdlineEnter <buffer> call help#keyword#set()
	autocmd CmdlineLeave <buffer> call help#keyword#unset()
augroup END "}}}
