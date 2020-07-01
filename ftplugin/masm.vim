let g:dosbox_conf = split(system('dosbox -printconf'))[0]

nnoremap <buffer> <LocalLeader>ll :split g:dosbox_conf<CR>
nnoremap <buffer> <LocalLeader>lL :Defx `fnamemodify(g:dosbox_conf, ':p:h')`<CR>

setlocal keywordprg=:Help

