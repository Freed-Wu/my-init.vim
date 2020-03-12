let b:clean = [
			\ '%<.pmx', '%<.pml',
			\ '%<.log', 'musixtex.log', 'pmxaerr.dat',
			\ ]

setlocal syntax=tex
setlocal makeprg=musixtex\ -t\ -F\ "xetex"\ %:p

autocmd! BufWinEnter *.mtx cd %:p:h
autocmd! BufLeave *.mtx cd %:p:h
			\| call init#clean#main(b:clean)

nnoremap <buffer> <LocalLeader>g :execute 'split '.expand('%:p:h').'/'.expand('%<').'.tex'<CR>
nnoremap <buffer> <LocalLeader>x :call netrw#BrowseX(expand('%<').'.pdf', 0)<CR>

