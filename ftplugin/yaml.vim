let b:jekyll_root_dir = getcwd()
let b:jekyll_post_dir = getcwd().expand('/_posts')

nnoremap <buffer> <LocalLeader>JJ :<C-u>Jserve<CR>
nnoremap <buffer> <LocalLeader>Jj :<C-u>Jbuild<CR>
nnoremap <buffer> <LocalLeader>Js :<C-u>JSpost<CR>
nnoremap <buffer> <LocalLeader>Jt :<C-u>JTpost<CR>
nnoremap <buffer> <LocalLeader>Jv :<C-u>JVpost<CR>
nnoremap <buffer> <LocalLeader>Jp :<C-u>Jpost<CR>

