let g:latex_to_unicode_auto = 1

call vimtex#init()
call tex#map#main()

setlocal foldmethod=syntax
setlocal foldtext=foldtext()
setlocal iskeyword-=:

inoremap <silent><buffer><expr> <TAB>
			\ coc#expandableOrJumpable() ? '\<C-r>=coc#rpc#request("doKeymap", ["snippets-expand-jump",""])\<CR>' :
			\ init#check_back_space#main() ? '<Tab>' :
			\ '<plug>L2UTab'
nnoremap <buffer> <Leader>zz :<C-u>call JuliaFormatter#Format(0)<CR>
xnoremap <buffer> <Leader>zz :<C-u>call JuliaFormatter#Format(1)<CR>

