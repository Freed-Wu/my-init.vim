autocmd! BufWritePre * %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/ge

setlocal nofoldenable

nnoremap <buffer> <M-q> ggdGZZ
inoremap <buffer> <C-x><C-x> <Plug>(github-complete-manual-completion)

