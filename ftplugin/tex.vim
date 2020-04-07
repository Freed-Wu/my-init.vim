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
augroup END "}}}

function! s:close() "{{{
	if executable('xdotool') && exists('b:vimtex') && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
		call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
	endif
endfunction "}}}

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

inoremap <buffer> ; ;<C-g>u
nnoremap <buffer> gK :silent !texdoc<Space>
nmap <buffer> <LocalLeader>i <plug>(vimtex-cmd-create)
xmap <buffer> <LocalLeader>i <plug>(vimtex-cmd-create)
nmap <buffer> yse <plug>(vimtex-cmd-toggle-star)
nmap <buffer> ysc <plug>(vimtex-env-toggle-star)
nmap <buffer> ysd <plug>(vimtex-delim-toggle-modifier)
nmap <buffer> ysD <plug>(vimtex-delim-toggle-modifier-reverse)
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
xmap <buffer> af <Plug>(textobj-latex-paren-math-a)
xmap <buffer> if <Plug>(textobj-latex-paren-math-i)
xmap <buffer> aF <Plug>(textobj-latex-bracket-math-a)
xmap <buffer> iF <Plug>(textobj-latex-bracket-math-i)
xmap <buffer> aq <Plug>(textobj-latex-quote-a)
xmap <buffer> iq <Plug>(textobj-latex-quote-i)
xmap <buffer> aQ <Plug>(textobj-latex-double-quote-a)
xmap <buffer> iQ <Plug>(textobj-latex-double-quote-i)

