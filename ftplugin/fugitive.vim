let g:which_key_map_fugitive_c = {
			\ 'name': 'choose a key about commit',
			\ }
let g:which_key_map_fugitive_d = {
			\ 'name': 'choose a key about diff',
			\ }
let g:which_key_map_fugitive_r = {
			\ 'name': 'choose a key about rebase',
			\ }

nnoremap <buffer><nowait> c :<C-u>WhichKey 'c'<CR>
nnoremap <buffer><nowait> d :<C-u>WhichKey 'd'<CR>
nnoremap <buffer><nowait> r :<C-u>WhichKey 'r'<CR>
nnoremap <buffer> R :<C-u>edit<CR>
nnoremap <buffer> A :G remote add origin <C-r>+<CR>
nnoremap <buffer> S :<C-u>G pull origin master --allow-unrelated-histories --recurse-submodules<CR>

