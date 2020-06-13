if getcwd() !=# expand('%:p:h')
	setlocal foldlevel=1
endif

if expand('%:e') ==# 'tex'
	let b:fswitchdst = 'bib,mtx'
	let b:fswitchlocs = 'bib'
elseif expand('%:e') ==# 'mtx'
	let b:fswitchlocs = 'tex'
endif
let b:clean_temp = [
			\ 'missfont.log', 'texput.log', 'mylatexformat.log',
			\ 'xelatex*.fls', '_markdown_*', '_minted-*',
			\ '**/*.dia~',
			\ ]

if expand('%:p') =~# '/usr/share/texmf'
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
else
	nmap <buffer> dsc <Plug>(vimtex-cmd-delete)
	nmap <buffer> dsd <Plug>(vimtex-delim-delete)
	nmap <buffer> dse <Plug>(vimtex-env-delete)
endif
nmap <buffer> crf <Plug>(vimtex-cmd-toggle-frac)
nmap <buffer> crj <Plug>(vimtex-delim-toggle-modifier)
nmap <buffer> crk <Plug>(vimtex-delim-toggle-modifier-reverse)
nmap <buffer> cre <Plug>(vimtex-env-toggle-star)
nmap <buffer> crc <Plug>(vimtex-cmd-toggle-star)
xmap <buffer> crf <Plug>(vimtex-cmd-toggle-frac)
xmap <buffer> crj <Plug>(vimtex-delim-toggle-modifier)
xmap <buffer> crk <Plug>(vimtex-delim-toggle-modifier-reverse)

augroup tex "{{{
	autocmd!
	autocmd User VimtexEventQuit call s:close()
				\| call init#clean#main(b:clean_temp)
	autocmd User VimtexEventTocCreated setfiletype latextoc
				\| call b:toc.set_syntax()
	autocmd BufWinEnter *.tex,*.dtx,*.cls,*.sty,*.ins setlocal concealcursor=
				\| setlocal iskeyword-=:
augroup END "}}}

function! s:close() "{{{
	if executable('xdotool') && exists('b:vimtex') && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
		call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
	endif
endfunction "}}}

call tex#map#main()

if expand('%:e') ==# 'nlo'
	setlocal makeprg=makeindex\ %\ -s\ nomencl.ist
elseif expand('%:e') ==# 'idx'
	setlocal makeprg=makeindex\ %
elseif expand('%:e') ==# 'mtx'
	let b:clean_temp += [
				\ '%<.pmx', '%<.pml',
				\ '%<.log', 'musixtex.log', 'pmxaerr.dat',
				\ ]
	setlocal makeprg=musixtex\ -t\ -F\ "xetex"\ %
elseif expand('%:e') ==# 'dtx'
	setlocal makeprg=latexmk\ %<.ins
elseif expand('%:e') ==# 'ins'
	setlocal makeprg=latexmk\ %
elseif expand('%:e') ==# 'tex'
	setlocal makeprg=lualatex\ -initialize\ -shell-escape\ \"&xelatex\"\ mylatexformat.ltx\ \"\"%\"\"
endif
setlocal keywordprg=:silent\ !texdoc
setlocal isfname-={,}
setlocal indentexpr=BuckyTexIndent()
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
if exists('$TEXWORKSPACE')
	setlocal path+=$TEXWORKSPACE/**1
elseif has('unix')
	setlocal path+=$HOME/.texlive/texmf-var/tex/latex/**1
elseif has('win32')
	setlocal path+=C:/Program\ Files/texlive/texmf-local/tex/latex/local
endif
if exists('$TEXRUNTIME')
	setlocal path+=$TEXRUNTIME/**4
elseif has('unix')
	setlocal path+=/usr/share/texmf-dist/**4
elseif has('win42')
	setlocal path+=C:/Program\ Files/texlive/2019/texmf-dist/**4
endif

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
nmap <buffer> <LocalLeader>K <plug>(vimtex-doc-package)
xmap <buffer> <LocalLeader>K <plug>(vimtex-doc-package)

