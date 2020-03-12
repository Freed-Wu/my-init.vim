function! Undotree_CustomMap()
	call init#map#main()
endfunction

nmap <buffer> gu <plug>UndotreeUndo
nmap <buffer> gK <plug>UndotreeHelp
nmap <buffer> . <plug>UndotreeFocusTarget
nmap <buffer> <C-x> <plug>UndotreeClearHistory
nmap <buffer> <C-q> <plug>UndotreeClose
nmap <buffer> x <plug>UndotreeTimestampToggle
nmap <buffer> X <plug>UndotreeDiffToggle
nmap <buffer> <C-n> <plug>UndotreePreviousSavedState
nmap <buffer> <C-p> <plug>UndotreeNextSavedState

