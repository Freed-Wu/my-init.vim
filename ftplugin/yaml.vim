let b:jekyll_root_dir = getcwd()
let b:jekyll_post_dir = getcwd().expand('/_posts')

nnoremap <buffer> <LocalLeader>ll :<C-u>Jbuild<CR>
nnoremap <buffer> <LocalLeader>lL :<C-u>Jserve<CR>
