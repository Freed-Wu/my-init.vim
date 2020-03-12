if expand('%:') =~ '.*tab.*plot\.m'
	nnoremap <buffer> <LocalLeader>b gg:/fpath<CR>f'<C-w>f
endif

setlocal makeprg=octave\ %:p
setlocal runtimepath+=$OCTAVEWORKSPACE/**2

if executable('mlint')
	nnoremap <buffer> <LocalLeader>1 :setlocal makeprg=mlint\ %:p<CR>
endif
nnoremap <buffer> <LocalLeader>s :split $MYOCTAVERC<CR>
nnoremap <buffer> <LocalLeader>SS :split $MYGOCTAVERC<CR>
nnoremap <buffer> <LocalLeader>S1 :split $MATLAB/lcdata.xml<CR>
nnoremap <buffer> <LocalLeader>S2 :split $MYMATLABRC<CR>

