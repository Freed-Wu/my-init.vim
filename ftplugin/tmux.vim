setlocal path+=$TMUX_PLUGIN_MANAGER_PATH
setlocal foldmethod=marker

let b:browser_search_default_engine = 'github'

nnoremap <buffer> gd :<C-u>execute 'edit' glob($TMUX_PLUGIN_MANAGER_PATH . split(expand('<cfile>'), '/')[1] . '/README.*', 0, 1)[0]<CR>
nnoremap <buffer> gD :<C-u>execute 'edit' glob($TMUX_PLUGIN_MANAGER_PATH . split(expand('<cfile>'), '/')[1] . '/docs/*', 0, 1)[0]<CR>
nnoremap <buffer> <C-w>d :<C-u>execute 'split' glob($TMUX_PLUGIN_MANAGER_PATH . split(expand('<cfile>'), '/')[1] . '/README.*', 0, 1)[0]<CR>
nnoremap <buffer> <C-w>D :<C-u>execute 'split' glob($TMUX_PLUGIN_MANAGER_PATH . split(expand('<cfile>'), '/')[1] . '/docs/*', 0, 1)[0]<CR>
nnoremap <nowait><buffer> <LocalLeader> :call quickui#context#open(b:context, {})<CR>
xnoremap <nowait><buffer> <LocalLeader> :call quickui#context#open(b:context_v, {})<CR>
let b:context = [
      \ ['&Echo', 'echo system("tmux show -g " . expand("<cWORD>"))'],
      \ ['E&xecute', 'echo system("tmux " . getline(line(".")))'],
      \ ]
let b:context_v = [
      \ ['&Echo', 'echo system("tmux show -g " . getline(line("v"),line("''>") - 1))'],
      \ ['E&xecute', 'echo system("tmux " . getline(line("v"),line("''>") - 1))'],
      \ ]
