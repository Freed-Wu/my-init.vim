if getcwd() != expand('%:p:h')
	setlocal foldlevel=1
endif

if expand('%') == 'main.tex'
	nnoremap <buffer> <LocalLeader>g :Rooter<CR>:split .latexmkrc<CR>
else
	nnoremap <buffer> <LocalLeader>g :Rooter<CR>:split main.tex<CR>
endif

let g:neoformat_tex_latexindent = {
			\ 'exe': 'latexindent',
			\ 'args': ['--logfile=' . g:neoformat_data.'/indent.log', '%'],
			\ }
let b:clean_temp = [
			\ 'cha/*.aux', 'cha/*.log',
			\ 'cha/missfont.log', 'cha/texput.log',
			\ 'cha/*.upa', 'cha/*.upb', 'cha/mylatexformat.log',
			\ 'etc/*.aux', 'etc/*.log',
			\ 'fig/*.aux', 'fig/*.log',
			\ 'fig/*/*.aux', 'fig/*/*.log',
			\ 'mtx/*.pdf',
			\ 'missfont.log', 'texput.log',
			\ '*.upa', '*.upb', 'mylatexformat.log',
			\ '*.pygtex', '*.pygstyle', '%<.pyg',
			\ 'xelatex*.fls',
			\ '%<.aux', '%<.log', '%<.mx*',
			\ '%<.lof', '%<.lot', '%<.loe', '%<.toc',
			\ '%<.bbl', '%<.brf', '%<.blg',
			\ '%<.ind', '%<.idx', '%<.ilg',
			\ '%<.acn', '%<.acr', '%<.alg',
			\ '%<.glg', '%<.glo', '%<.gls',
			\ '%<.ist', '%<.listing',
			\ '%<.cmap',
			\ '%<.csvtoken',
			\ '%<.gnuplot', '%<.nav', '%<.snm', '%<.vrb',
			\ '%<.xdv', '%<.out', '"%<.synctex(busy)"',
			\ '%<.mw', '%<.mw.mw',
			\ '%<.fdb_latexmk',
			\ 'main.aux', 'main.log', 'main.mx*',
			\ 'main.lof', 'main.lot', 'main.loe', 'main.toc',
			\ 'main.bbl', 'main.brf', 'main.blg',
			\ 'main.ind', 'main.idx', 'main.ilg',
			\ 'main.acn', 'main.acr', 'main.alg',
			\ 'main.glg', 'main.glo', 'main.gls',
			\ 'main.ist', 'main.listing',
			\ 'main.cmap',
			\ 'main.gnuplot', 'main.nav', 'main.snm', 'main.vrb',
			\ 'main.xdv', 'main.out', '"main.synctex(busy)"',
			\ 'main.mw', 'main.mw.mw',
			\ 'main.fdb_latexmk',
			\ 'fig/*.dia~', 'fig/*/*.dia~',
			\ 'fig/Thumbs.db', 'fig/*/Thumbs.db',
			\ 'misc/*.ms14 (Security copy)',
			\ '.vs', '.vscode', '_minted-*', 'cha/_minted-*',
			\ ]
let b:clean = b:clean_temp + [
			\ 'cha/*.fmt', 'cha/*.synctex.gz', 'cha/*.pdf',
			\ '*.fmt', '*.synctex.gz',
			\ '*.fls'
			\ ]

Rooter

"call deoplete#custom#var('omni', 'input_patterns', {
			"\ 'tex': g:vimtex#re#deoplete
			"\ })

"autocmd! User VimtexEventInitPost call tex#view#main()
			"\| call vimtex#compiler#compile()
"autocmd! User VimtexEventQuit call tex#close#main()
autocmd! BufWinLeave *.tex call tex#close#main()
			"\| call vimtex#compiler#clean(0)
autocmd! BufWinLeave *.tex call init#clean#main(b:clean_temp)

setlocal makeprg=xelatex\ -initialize\ -shell-escape\ \"&xelatex\"\ mylatexformat.ltx\ \"\"%\"\"
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
setlocal spell

inoremap <buffer> ; ;<C-g>u
nnoremap <buffer> gK :silent !texdoc<Space>
if exists('$MYTEXRC')
	nnoremap <buffer> gS :split $MYTEXRC<CR>
elseif has('unix')
	nnoremap <buffer> gS :split /usr/share/texmf-dist/web2c/texmf.cnf<CR>
elseif has('win32')
	nnoremap <buffer> gS :split C:/Program\ Files/texlive/2019/texmf.cnf<CR>
endif
nnoremap <buffer> <LocalLeader>c :call init#clean#main(b:clean)<CR>
nnoremap <buffer> <LocalLeader>b :Rooter<CR>:split bib/main.bib<CR>
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
xmap <buffer> af <Plug>(textobj-latex-paren-math-a)
xmap <buffer> if <Plug>(textobj-latex-paren-math-i)
xmap <buffer> aq <Plug>(textobj-latex-quote-a)
xmap <buffer> iq <Plug>(textobj-latex-quote-i)
xmap <buffer> aQ <Plug>(textobj-latex-double-quote-a)
xmap <buffer> iQ <Plug>(textobj-latex-double-quote-i)

