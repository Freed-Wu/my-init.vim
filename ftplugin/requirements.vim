setlocal makeprg=pip\ install\ -r\ %

nnoremap <LocalLeader>ll :<C-u>%!pip freeze<CR>
