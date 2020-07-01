let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_auto = 1

call vimtex#init()
call tex#map#main()

setlocal foldmethod=syntax
setlocal foldtext=foldtext()
setlocal iskeyword-=:
setlocal makeprg=julia\ %

command! -buffer -nargs=? Neoformat call JuliaFormatter#Format(1)

