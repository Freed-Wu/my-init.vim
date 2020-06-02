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
command! -buffer -nargs=? Neoformat call JuliaFormatter#Format(1)

