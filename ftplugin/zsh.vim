setlocal foldmethod=marker
setlocal makeprg=source\ %
setlocal iskeyword+=-,:
if expand('%:p') ==# $HOME . '/.zshrc'
      setlocal path=~/.zinit/plugins,~/.zinit/plugins/ohmyzsh/plugins
      let b:browser_search_default_engine = 'github'
endif

nnoremap <buffer> gd :<C-u>execute 'edit' glob('~/.zinit/plugins/' . split(expand('<cfile>'), '/')[1] . '/README.*', 0, 1)[0]<CR>
nnoremap <buffer> gD :<C-u>execute 'edit' glob('~/.zinit/plugins/' . split(expand('<cfile>'), '/')[1] . '/*.plugin.zsh', 0, 1)[0]<CR>
nnoremap <buffer> <C-w>d :<C-u>execute 'split' glob('~/.zinit/plugins/' . split(expand('<cfile>'), '/')[1] . '/README.*', 0, 1)[0]<CR>
nnoremap <buffer> <C-w>D :<C-u>execute 'split' glob('~/.zinit/plugins/' . split(expand('<cfile>'), '/')[1] . '/*.plugin.zsh', 0, 1)[0]<CR>
nnoremap <nowait><buffer> <LocalLeader> :call quickui#context#open(b:context, {})<CR>
xnoremap <nowait><buffer> <LocalLeader> :call quickui#context#open(b:context_v, {})<CR>
let b:context = [
      \ ['&Echo', 'echo system("echo " . expand("<cWORD>"))'],
      \ ['E&xecute', 'echo system(expand("<cWORD>"))'],
      \ ]
let b:context_v = [
      \ ['&Echo', 'echo system("echo " . getline(".")[col("v") - 1:col("''>")])'],
      \ ['E&xecute', 'echo system(getline(".")[col("v") - 1:col("''>")])'],
      \ ]
