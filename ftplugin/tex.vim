if getcwd() !=# expand('%:p:h')
	setlocal foldlevel=1
endif

let b:clean_temp = [
			\ 'missfont.log', 'texput.log', 'mylatexformat.log',
			\ 'xelatex*.fls', '_markdown_*', '_minted-*',
			\ '**/*.dia~',
			\ ]

augroup tex "{{{
	autocmd!
	autocmd User VimtexEventQuit *.tex call s:close()
				\| call init#clean#main(b:clean_temp)
	autocmd User VimtexEventTocCreated setfiletype latextoc
				\| call b:toc.set_syntax()
augroup END "}}}

function! s:close() "{{{
	if executable('xdotool') && exists('b:vimtex') && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
		call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
	endif
endfunction "}}}

call tex#map#main()

setlocal makeprg=lualatex\ -initialize\ -shell-escape\ \"&xelatex\"\ mylatexformat.ltx\ \"\"%\"\"
setlocal keywordprg=:silent\ !texdoc
setlocal isfname-={,}
setlocal iskeyword-=:
if exists('$TEXWORKSPACE')
	setlocal path+=$TEXWORKSPACE/**1
elseif has('unix')
	setlocal path+=$HOME/.texlive/texmf-var/tex/latex/**1
elseif has('win32')
	setlocal path+=C:/Program\ Files/texlive/texmf-local/tex/latex/local
endif
if exists('$TEXRUNTIME')
	setlocal path+=$TEXRUNTIME/**3
elseif has('unix')
	setlocal path+=/usr/share/texmf-dist/**3
elseif has('win32')
	setlocal path+=C:/Program\ Files/texlive/2019/texmf-dist/**3
endif
"setlocal indentexpr=BuckyTexIndent()
setlocal indentexpr=VimtexIndentExpr()
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

inoremap <buffer> -- <Space>--<Space>
inoremap <buffer> - -
inoremap <buffer> > >
inoremap <buffer> < <
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
xmap <buffer> <LocalLeader>K <plug>(vimtex-doc-package)

