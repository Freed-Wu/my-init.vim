function! Undotree_CustomMap()
	call init#map#main()
endfunction

nmap <buffer> gj <plug>UndotreePreviousSavedState
nmap <buffer> gk <plug>UndotreeNextSavedState
nmap <buffer> J <plug>UndotreeUndo
nmap <buffer> K <plug>UndotreeRedo
nmap <buffer> o <plug>UndotreeFocusTarget
nmap <buffer> <C-x> <plug>UndotreeClearHistory
nmap <buffer> ZQ <plug>UndotreeClose
nmap <buffer> <LocalLeader>t <plug>UndotreeTimestampToggle
nmap <buffer> <LocalLeader>d <plug>UndotreeDiffToggle

