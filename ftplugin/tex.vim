if expand('%:e') ==# 'tex'
	let b:fswitchdst = 'bib,mtx'
	let b:fswitchlocs = 'bib'
elseif expand('%:e') ==# 'mtx'
	let b:fswitchlocs = 'tex'
	setlocal autochdir
endif
if getcwd() !=# expand('%:p:h')
	setlocal foldlevel=1
endif
if expand('%:e') ==# 'nlo'
	setlocal makeprg=makeindex\ %\ -s\ nomencl.ist
elseif expand('%:e') ==# 'idx'
	setlocal makeprg=makeindex\ %
elseif expand('%:e') ==# 'mtx'
	setlocal makeprg=musixtex\ -t\ -F\ "xetex"\ %
elseif expand('%:e') ==# 'dtx'
	setlocal makeprg=latexmk\ %:r.ins
elseif expand('%:e') ==# 'ins'
	setlocal makeprg=latexmk\ %
elseif expand('%:e') ==# 'tex'
	setlocal makeprg=:VimtexCompile
endif
if has('unix')
	setlocal path+=$HOME/.texlive/texmf-var/tex/latex/**1
	setlocal path+=/usr/share/texmf-dist/**4
elseif has('win32')
	setlocal path+=C:/Program\ Files/texlive/texmf-local/tex/latex/local
	setlocal path+=C:/Program\ Files/texlive/*/texmf-dist/**4
endif
setlocal path+=fig
setlocal iskeyword-=:
setlocal isfname-={,}
setlocal indentexpr=BuckyTexIndent()
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

augroup tex "{{{
	autocmd!
	autocmd User VimtexEventQuit call s:close()
	autocmd User VimtexEventTocCreated setfiletype latextoc
				\| call b:toc.set_syntax()
augroup END "}}}

function! s:close() "{{{
	if executable('xdotool') && exists('b:vimtex') && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
		call system(join(['xdotool windowclose', b:vimtex.viewer.xwin_id], ' '))
	endif
endfunction "}}}

call tex#map#main()

nmap <buffer> [[ <plug>(vimtex-[[)
nmap <buffer> [] <plug>(vimtex-[])
nmap <buffer> ][ <plug>(vimtex-][)
nmap <buffer> ]] <plug>(vimtex-]])
omap <buffer> [[ <plug>(vimtex-[[)
omap <buffer> [] <plug>(vimtex-[])
omap <buffer> ][ <plug>(vimtex-][)
omap <buffer> ]] <plug>(vimtex-]])
xmap <buffer> [[ <plug>(vimtex-[[)
xmap <buffer> [] <plug>(vimtex-[])
xmap <buffer> ][ <plug>(vimtex-][)
xmap <buffer> ]] <plug>(vimtex-]])
