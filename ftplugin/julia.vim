let g:latex_to_unicode_auto = 1

nnoremap <buffer> <Leader>zz :<C-u>call JuliaFormatter#Format(0)<CR>
xnoremap <buffer> <Leader>zz :<C-u>call JuliaFormatter#Format(1)<CR>

