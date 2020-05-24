call init#set#main()

setlocal indentexpr=pymode#indent#get_indent(v:lnum)

nnoremap <buffer> <C-w>d $:sfind %:p:h/<cword>.snippets<CR>
nnoremap <buffer> gd $:find %:p:h/<cword>.snippets<CR>

