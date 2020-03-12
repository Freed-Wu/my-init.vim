setlocal makeprg=sdraw\ %:p
setlocal nowrap

nnoremap <buffer> <LocalLeader>1 :setlocal makeprg=sdraw\ %<CR>
nnoremap <buffer> <LocalLeader>2 :setlocal makeprg=pympress\ %<CR>
nnoremap <buffer> <LocalLeader>3 :setlocal makeprg=pdfcrop\ %<.pdf\ %<.output.pdf<CR>
nnoremap <buffer> <LocalLeader>4 :setlocal makeprg=pdftocairo\ %<.pdf\ %<.output.pdf<CR>
nnoremap <buffer> <LocalLeader>g :split %<.tex<CR>

