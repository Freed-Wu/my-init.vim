if expand('%:p:h') =~ 'diffpanel_3'
	setlocal readonly
	setlocal nomodifiable
endif

call init#map#main()

nmap <buffer> [M <Plug>(textobj-diff-file-P)
nmap <buffer> ]M <Plug>(textobj-diff-file-N)
nmap <buffer> [m <Plug>(textobj-diff-file-p)
nmap <buffer> ]m <Plug>(textobj-diff-file-n)
nmap <buffer> [] <Plug>(textobj-diff-hunk-P)
nmap <buffer> ][ <Plug>(textobj-diff-hunk-N)
nmap <buffer> [[ <Plug>(textobj-diff-hunk-p)
nmap <buffer> ]] <Plug>(textobj-diff-hunk-n)
xmap <buffer> [M <Plug>(textobj-diff-file-P)
xmap <buffer> ]M <Plug>(textobj-diff-file-N)
xmap <buffer> [m <Plug>(textobj-diff-file-p)
xmap <buffer> ]m <Plug>(textobj-diff-file-n)
xmap <buffer> [] <Plug>(textobj-diff-hunk-P)
xmap <buffer> ][ <Plug>(textobj-diff-hunk-N)
xmap <buffer> [[ <Plug>(textobj-diff-hunk-p)
xmap <buffer> ]] <Plug>(textobj-diff-hunk-n)
omap <buffer> [M <Plug>(textobj-diff-file-P)
omap <buffer> [M <Plug>(textobj-diff-file-N)
omap <buffer> [m <Plug>(textobj-diff-file-p)
omap <buffer> ]m <Plug>(textobj-diff-file-n)
omap <buffer> [] <Plug>(textobj-diff-hunk-P)
omap <buffer> ][ <Plug>(textobj-diff-hunk-N)
omap <buffer> [[ <Plug>(textobj-diff-hunk-p)
omap <buffer> ]] <Plug>(textobj-diff-hunk-n)
xmap <buffer> aD <Plug>(textobj-diff-file)
xmap <buffer> ad <Plug>(textobj-diff-hunk)
xmap <buffer> iD <Plug>(textobj-diff-file)
xmap <buffer> id <Plug>(textobj-diff-hunk)
omap <buffer> aD <Plug>(textobj-diff-file)
omap <buffer> ad <Plug>(textobj-diff-hunk)

