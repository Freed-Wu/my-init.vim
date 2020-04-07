if (expand('%:p:h') =~# substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~# substitute($GITWORKSPACE, '\', '\\\\', 'g')) && expand('%:p:h') !~# $GITNAME
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
endif

source <sfile>:p:h/vim.vim

setlocal nonumber
setlocal norelativenumber
if &buftype !=# 'help'
	setlocal foldlevel=99
else
	setlocal buftype=help
endif
setlocal formatexpr=bucky#md#format()
setlocal foldmethod=expr
setlocal iskeyword+=-

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
omap <buffer> <LocalLeader>k <Plug>(textobj-help-any-p)
omap <buffer> <LocalLeader>j <Plug>(textobj-help-any-n)
omap <buffer> <LocalLeader>K <Plug>(textobj-help-any-P)
omap <buffer> <LocalLeader>J <Plug>(textobj-help-any-N)
nmap <buffer> [[ <Plug>(textobj-help-link-p)
nmap <buffer> ]] <Plug>(textobj-help-link-n)
nmap <buffer> [] <Plug>(textobj-help-link-P)
nmap <buffer> ][ <Plug>(textobj-help-link-N)
nmap <buffer> [m <Plug>(textobj-help-option-p)
nmap <buffer> ]m <Plug>(textobj-help-option-n)
nmap <buffer> [M <Plug>(textobj-help-option-P)
nmap <buffer> ]M <Plug>(textobj-help-option-N)
nmap <buffer> <LocalLeader>k <Plug>(textobj-help-any-p)
nmap <buffer> <LocalLeader>j <Plug>(textobj-help-any-n)
nmap <buffer> <LocalLeader>K <Plug>(textobj-help-any-P)
nmap <buffer> <LocalLeader>J <Plug>(textobj-help-any-N)

