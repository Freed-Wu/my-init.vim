if (expand('%:p:h') =~ substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~ substitute($GITWORKSPACE, '\', '\\\\', 'g')) && expand('%:p:h') !~ $USER
	setlocal nomodifiable
	setlocal readonly
	"call init#map#main()
else
	setlocal spell
endif

let b:clean = ['%<.docx', '%<.html', '%<.doc', '%<.htm', '%<.pdf']

call vimtex#init()

setlocal foldmethod=expr
setlocal foldexpr=StackedMarkdownFolds()
setlocal foldtext=foldtext()
setlocal makeprg=pandoc\ --smart\ -o\ %<.docx\ %

if executable('tree')
	nnoremap <buffer> <LocalLeader>o :.read !tree<CR>
endif
inoremap <buffer> * *
inoremap <buffer> ** **
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
nnoremap <buffer> <LocalLeader>lt :TOC<CR><C-w>L:execute 'vertical resize '.g:columns<CR>
nmap <buffer> gs <Plug>MarkdownPreviewToggle
xmap <buffer> if <Plug>(textobj-markdown-chunk-i)
xmap <buffer> af <Plug>(textobj-markdown-chunk-a)
xmap <buffer> iF <Plug>(textobj-markdown-Bchunk-i)
xmap <buffer> aF <Plug>(textobj-markdown-Bchunk-a)
omap <buffer> if <Plug>(textobj-markdown-chunk-i)
omap <buffer> af <Plug>(textobj-markdown-chunk-a)
omap <buffer> iF <Plug>(textobj-markdown-Bchunk-i)
omap <buffer> aF <Plug>(textobj-markdown-Bchunk-a)
xmap <buffer> ie <Plug>(textobj-markdown-text-i)
xmap <buffer> ae <Plug>(textobj-markdown-text-a)
xmap <buffer> iE <Plug>(textobj-markdown-Btext-i)
xmap <buffer> aE <Plug>(textobj-markdown-Btext-a)
omap <buffer> ie <Plug>(textobj-markdown-text-i)
omap <buffer> ae <Plug>(textobj-markdown-text-a)
omap <buffer> iE <Plug>(textobj-markdown-Btext-i)
omap <buffer> aE <Plug>(textobj-markdown-Btext-a)
"nmap <buffer> [[ <Plug>(textobj-markdown-Gheader-p)
"xmap <buffer> [[ <Plug>(textobj-markdown-Gheader-p)
"omap <buffer> [[ <Plug>(textobj-markdown-Gheader-p)
"nmap <buffer> ]] <Plug>(textobj-markdown-Gheader-n)
"xmap <buffer> ]] <Plug>(textobj-markdown-Gheader-n)
"omap <buffer> ]] <Plug>(textobj-markdown-Gheader-n)
xmap <buffer> [j <Plug>(textobj-markdown-chunk-p)
xmap <buffer> [J <Plug>(textobj-markdown-Bchunk-p)
xmap <buffer> [m <Plug>(textobj-markdown-text-p)
xmap <buffer> [M <Plug>(textobj-markdown-Btext-p)
xmap <buffer> ]j <Plug>(textobj-markdown-chunk-n)
xmap <buffer> ]J <Plug>(textobj-markdown-Bchunk-n)
xmap <buffer> ]m <Plug>(textobj-markdown-text-n)
xmap <buffer> ]M <Plug>(textobj-markdown-Btext-n)
omap <buffer> [j <Plug>(textobj-markdown-chunk-p)
omap <buffer> [J <Plug>(textobj-markdown-Bchunk-p)
omap <buffer> [m <Plug>(textobj-markdown-text-p)
omap <buffer> [M <Plug>(textobj-markdown-Btext-p)
omap <buffer> ]j <Plug>(textobj-markdown-chunk-n)
omap <buffer> ]J <Plug>(textobj-markdown-Bchunk-n)
omap <buffer> ]m <Plug>(textobj-markdown-text-n)
omap <buffer> ]M <Plug>(textobj-markdown-Btext-n)
nmap <buffer> [j <Plug>(textobj-markdown-chunk-p)
nmap <buffer> [J <Plug>(textobj-markdown-Bchunk-p)
nmap <buffer> [m <Plug>(textobj-markdown-text-p)
nmap <buffer> [M <Plug>(textobj-markdown-Btext-p)
nmap <buffer> ]j <Plug>(textobj-markdown-chunk-n)
nmap <buffer> ]J <Plug>(textobj-markdown-Bchunk-n)
nmap <buffer> ]m <Plug>(textobj-markdown-text-n)
nmap <buffer> ]M <Plug>(textobj-markdown-Btext-n)

