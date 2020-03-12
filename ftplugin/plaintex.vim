if expand('%:p') =~ 'texmf-dist'
	setlocal readonly
	setlocal nomodifiable
	call init#map#main()
endif

let g:tex_conceal='abdmgs'

autocmd! InsertLeave *.tex
			\ execute ((col('$') >= &textwidth && &textwidth != 0)?'normal! =ipgwipgi':'')

setlocal keywordprg=:silent\ !texdoc
setlocal conceallevel=2
setlocal concealcursor=

nnoremap <buffer> gK :silent !texdoc<Space>

