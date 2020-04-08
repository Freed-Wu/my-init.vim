if (expand('%:p:h') =~# substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~# substitute($GITWORKSPACE, '\', '\\\\', 'g')) && expand('%:p:h') !~# $GITNAME
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
endif

if expand('%:p:t:r') !=# 'README'
	setlocal nospell
endif

let g:mkdp_auto_close = 0
let g:mkdp_port = '8090'
let b:clean = ['%<.docx', '%<.html', '%<.doc', '%<.htm', '%<.pdf']

call vimtex#init()

if expand('%:p:h') =~# 'vim'
	call vim#map#main()
endif

setlocal foldexpr=pandoc#folding#FoldExpr()
setlocal foldtext=foldtext()
setlocal foldlevel=1
setlocal makeprg=pandoc\ -o\ %<.pdf\ %\ --filter\ pandoc-csv2table
setlocal include=^\\s*!
setlocal iskeyword+=-

if executable('tree')
	if has('unix')
		nnoremap <buffer> <LocalLeader>o :.read !tree -a<CR>
		nnoremap <buffer> <LocalLeader>O :.read !tree -d<CR>
	else
		nnoremap <buffer> <LocalLeader>o :.read !tree<CR>
	endif
endif
inoremap <nowait> <buffer> * *
inoremap <nowait> <buffer> & <Space>&<Space>
inoremap <nowait> <buffer> <Bar> <Bar>
nnoremap <buffer> gsp :<C-u>Defx ~/.pandoc<CR>
inoremap <buffer> <C-x><C-x> <Plug>(github-complete-manual-completion)
nmap <buffer> <LocalLeader>e <Plug>(pandoc-keyboard-toggle-emphasis)
nmap <buffer> <LocalLeader>M :<C-u>Pandoc! pdf --filter pandoc-csv2table<CR>
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
nmap <buffer> [\ <plug>(textobj-markdown-Btext-p)
nmap <buffer> ]\ <plug>(textobj-markdown-Btext-n)
nmap <buffer> [v <plug>(textobj-markdown-chunk-p)
nmap <buffer> ]v <plug>(textobj-markdown-chunk-n)
nmap <buffer> [V <plug>(textobj-markdown-Bchunk-p)
nmap <buffer> ]V <plug>(textobj-markdown-Bchunk-n)
xmap <buffer> [\ <plug>(textobj-markdown-Btext-p)
xmap <buffer> ]\ <plug>(textobj-markdown-Btext-n)
xmap <buffer> [v <plug>(textobj-markdown-chunk-p)
xmap <buffer> ]v <plug>(textobj-markdown-chunk-n)
xmap <buffer> [V <plug>(textobj-markdown-Bchunk-p)
xmap <buffer> ]V <plug>(textobj-markdown-Bchunk-n)

