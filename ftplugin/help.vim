call vim#map#main()
call init#set#main()

setlocal nonumber
setlocal norelativenumber
if &buftype !=# 'help'
	setlocal foldlevel=99
endif
setlocal buftype=help
setlocal formatexpr=bucky#md#format()
setlocal foldmethod=expr
setlocal iskeyword+=-

nnoremap <buffer> <LocalLeader>ot :.!toilet<CR>
xnoremap <buffer> <LocalLeader>ot !toilet<CR>
nnoremap <buffer> <LocalLeader>of :.!figlet<CR>
xnoremap <buffer> <LocalLeader>of !figlet<CR>
nnoremap <buffer> <LocalLeader>ov :put =vanner#string(getline('.'),{})<CR>
nnoremap <buffer> <LocalLeader>o- :call init#banner#main('-')<CR>
nnoremap <buffer> <LocalLeader>o_ :call init#banner#main('_')<CR>
nnoremap <buffer> <LocalLeader>o= :call init#banner#main('=')<CR>
nnoremap <buffer> <LocalLeader>o+ :call init#banner#main('+')<CR>
nnoremap <buffer> <LocalLeader>o* :call init#banner#main('*')<CR>
xmap <buffer> [[ <Plug>(textobj-help-link-p)
xmap <buffer> ]] <Plug>(textobj-help-link-n)
xmap <buffer> [] <Plug>(textobj-help-link-P)
xmap <buffer> ][ <Plug>(textobj-help-link-N)
xmap <buffer> [m <Plug>(textobj-help-option-p)
xmap <buffer> ]m <Plug>(textobj-help-option-n)
xmap <buffer> [M <Plug>(textobj-help-option-P)
xmap <buffer> ]M <Plug>(textobj-help-option-N)
xmap <buffer> <LocalLeader>k <Plug>(textobj-help-any-p)
xmap <buffer> <LocalLeader>j <Plug>(textobj-help-any-n)
xmap <buffer> <LocalLeader>K <Plug>(textobj-help-any-P)
xmap <buffer> <LocalLeader>J <Plug>(textobj-help-any-N)
omap <buffer> [[ <Plug>(textobj-help-link-p)
omap <buffer> ]] <Plug>(textobj-help-link-n)
omap <buffer> [] <Plug>(textobj-help-link-P)
omap <buffer> ][ <Plug>(textobj-help-link-N)
omap <buffer> [m <Plug>(textobj-help-option-p)
omap <buffer> ]m <Plug>(textobj-help-option-n)
omap <buffer> [M <Plug>(textobj-help-option-P)
omap <buffer> ]M <Plug>(textobj-help-option-N)
omap <buffer> [F <Plug>(textobj-help-any-p)
omap <buffer> ]F <Plug>(textobj-help-any-n)
omap <buffer> [E <Plug>(textobj-help-any-P)
omap <buffer> ]E <Plug>(textobj-help-any-N)
nmap <buffer> [[ <Plug>(textobj-help-link-p)
nmap <buffer> ]] <Plug>(textobj-help-link-n)
nmap <buffer> [] <Plug>(textobj-help-link-P)
nmap <buffer> ][ <Plug>(textobj-help-link-N)
nmap <buffer> [m <Plug>(textobj-help-option-p)
nmap <buffer> ]m <Plug>(textobj-help-option-n)
nmap <buffer> [M <Plug>(textobj-help-option-P)
nmap <buffer> ]M <Plug>(textobj-help-option-N)
nmap <buffer> [F <Plug>(textobj-help-any-p)
nmap <buffer> ]F <Plug>(textobj-help-any-n)
nmap <buffer> [E <Plug>(textobj-help-any-P)
nmap <buffer> ]E <Plug>(textobj-help-any-N)

