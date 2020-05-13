let g:mkdp_auto_close = 0
let g:mkdp_port = '8090'
let b:clean = ['%<.docx', '%<.html', '%<.doc', '%<.htm', '%<.pdf']

call vimtex#init()
call tex#map#main()
call dot#map#main()

if expand('%:p:t:r') ==# 'README'
	if (expand('%:p:h') =~# substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~# substitute($GITWORKSPACE, '\', '\\\\', 'g')) && expand('%:p:h') !~# $GITNAME
		setlocal nomodifiable
		setlocal readonly
		call init#map#main()
		nnoremap <buffer> dsd <Nop>
		nnoremap <buffer> dsc <Nop>
		nnoremap <buffer> dse <Nop>
		unmap <buffer> dsd
		unmap <buffer> dsc
		unmap <buffer> dse
	endif
else
	setlocal nospell
endif

if expand('%:p:h') =~# 'vim'
	call vim#map#main()
endif

setlocal foldexpr=pandoc#folding#FoldExpr()
setlocal foldtext=foldtext()
setlocal foldlevel=1
setlocal makeprg=pandoc\ -o\ %<.pdf\ %\ --filter\ pandoc-csv2table
setlocal include=^\\s*!
setlocal iskeyword+=-

augroup pandoc "{{{
	autocmd!
	autocmd BufWinEnter *.md,*.markdown,*.mkd,*.pandoc setlocal concealcursor=
augroup END "}}}

nmap <buffer> <LocalLeader>j :<C-u>Pandoc! pdf --filter pandoc-csv2table<CR>
if has('unix')
	nnoremap <buffer> <LocalLeader>oa :.read !tree -a<CR>
	nnoremap <buffer> <LocalLeader>od :.read !tree -d<CR>
else
	nnoremap <buffer> <LocalLeader>oa :.read !tree<CR>
endif
nnoremap <buffer> <LocalLeader>oo :.read !gh-md-toc %<CR>
inoremap <nowait> <buffer> - -
inoremap <nowait> <buffer> * *
inoremap <nowait> <buffer> & <Space>&<Space>
inoremap <nowait> <buffer> <Bar> <Bar>
nnoremap <buffer> gsp :<C-u>Defx ~/.pandoc<CR>
inoremap <buffer> <C-x><C-x> <Plug>(github-complete-manual-completion)
nmap <buffer> <LocalLeader>e <Plug>(pandoc-keyboard-toggle-emphasis)
nmap <buffer> <LocalLeader>e <Plug>(pandoc-keyboard-toggle-emphasis)
nmap <buffer> <localleader>b <Plug>(pandoc-keyboard-toggle-strong)
vmap <buffer> <localleader>b <Plug>(pandoc-keyboard-toggle-strong)
nmap <buffer> <localleader>' <Plug>(pandoc-keyboard-toggle-verbatim)
vmap <buffer> <localleader>' <Plug>(pandoc-keyboard-toggle-verbatim)
nmap <buffer> <localleader>~~ <Plug>(pandoc-keyboard-toggle-strikeout)
vmap <buffer> <localleader>~~ <Plug>(pandoc-keyboard-toggle-strikeout)
nmap <buffer> <localleader>^ <Plug>(pandoc-keyboard-toggle-superscript)
vmap <buffer> <localleader>^ <Plug>(pandoc-keyboard-toggle-superscript)
nmap <buffer> <localleader>_ <Plug>(pandoc-keyboard-toggle-subscript)
vmap <buffer> <localleader>_ <Plug>(pandoc-keyboard-toggle-subscript)
vmap <buffer> <silent> aPe <Plug>(pandoc-keyboard-select-emphasis-inclusive)
vmap <buffer> <silent> iPe <Plug>(pandoc-keyboard-select-emphasis-exclusive)
omap <buffer> aPe :normal vaPe<CR>
omap <buffer> iPe :normal viPe<CR>
vmap <buffer> <silent> aPs <Plug>(pandoc-keyboard-select-strong-inclusive)
vmap <buffer> <silent> iPs <Plug>(pandoc-keyboard-select-strong-exclusive)
omap <buffer> aPs :normal vaPs<CR>
omap <buffer> iPs :normal viPs<CR>
vmap <buffer> <silent> aPv <Plug>(pandoc-keyboard-select-verbatim-inclusive)
vmap <buffer> <silent> iPv <Plug>(pandoc-keyboard-select-verbatim-exclusive)
omap <buffer> aPv :normal vaPv<CR>
omap <buffer> iPv :normal viPv<CR>
vmap <buffer> <silent> aPk <Plug>(pandoc-keyboard-select-strikeout-inclusive)
vmap <buffer> <silent> iPk <Plug>(pandoc-keyboard-select-strikeout-exclusive)
omap <buffer> aPk :normal vaPk<CR>
omap <buffer> iPk :normal viPk<CR>
vmap <buffer> <silent> aPu <Plug>(pandoc-keyboard-select-superscript-inclusive)
vmap <buffer> <silent> iPu <Plug>(pandoc-keyboard-select-superscript-exclusive)
omap <buffer> aPu :normal vaPu<CR>
omap <buffer> iPu :normal viPu<CR>
vmap <buffer> <silent> aPt <Plug>(pandoc-keyboard-select-subscript-inclusive)
vmap <buffer> <silent> iPt <Plug>(pandoc-keyboard-select-subscript-exclusive)
omap <buffer> aPt :normal vaPl<CR>
omap <buffer> iPt :normal viPl<CR>
nmap <buffer> <LocalLeader>rr <Plug>(pandoc-keyboard-ref-insert)
nmap <buffer> <localleader>rg <Plug>(pandoc-keyboard-ref-goto)
nmap <buffer> <localleader>rb <Plug>(pandoc-keyboard-ref-backfrom)
nnoremap <buffer> <LocalLeader>lt :TOC<CR><C-w>L:execute 'vertical resize '.&columns / 4<CR>
nmap <buffer> gss <Plug>MarkdownPreview
nmap <buffer> gS <Plug>StopMarkdownPreview
nmap <buffer> gsS <Plug>MarkdownPreviewToggle
nmap <buffer> [f <plug>unimpairedDirectoryPrevious
nmap <buffer> ]f <plug>unimpairedDirectoryNext
xmap <buffer> [f <plug>unimpairedDirectoryPrevious
xmap <buffer> ]f <plug>unimpairedDirectoryNext
nmap <buffer> [F <plug>(textobj-markdown-text-p)
nmap <buffer> ]F <plug>(textobj-markdown-text-n)
nmap <buffer> [E <plug>(textobj-markdown-Btext-p)
nmap <buffer> ]E <plug>(textobj-markdown-Btext-n)
nmap <buffer> [m <plug>(textobj-markdown-chunk-p)
nmap <buffer> ]m <plug>(textobj-markdown-chunk-n)
nmap <buffer> [M <plug>(textobj-markdown-Bchunk-p)
nmap <buffer> ]M <plug>(textobj-markdown-Bchunk-n)
xmap <buffer> [F <plug>(textobj-markdown-text-p)
xmap <buffer> ]F <plug>(textobj-markdown-text-n)
xmap <buffer> [E <plug>(textobj-markdown-Btext-p)
xmap <buffer> ]E <plug>(textobj-markdown-Btext-n)
xmap <buffer> [m <plug>(textobj-markdown-chunk-p)
xmap <buffer> ]m <plug>(textobj-markdown-chunk-n)
xmap <buffer> [M <plug>(textobj-markdown-Bchunk-p)
xmap <buffer> ]M <plug>(textobj-markdown-Bchunk-n)
omap <buffer> [F <plug>(textobj-markdown-text-p)
omap <buffer> ]F <plug>(textobj-markdown-text-n)
omap <buffer> [E <plug>(textobj-markdown-Btext-p)
omap <buffer> ]E <plug>(textobj-markdown-Btext-n)
omap <buffer> [m <plug>(textobj-markdown-chunk-p)
omap <buffer> ]m <plug>(textobj-markdown-chunk-n)
omap <buffer> [M <plug>(textobj-markdown-Bchunk-p)
omap <buffer> ]M <plug>(textobj-markdown-Bchunk-n)

