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
nnoremap <buffer> <C-a> :execute 'G remote set-url origin' substitute(matchstr(join(readfile(expand('%:p:h') . '/config')), 'url = \zs\S*'), 'https://\(\w*\).com/\w*/\(\w*\)', 'git@\1.com:' . trim(system('git config --global user.name')) . '/\2', 'g')<CR>
nnoremap <buffer> S :<C-u>G pull origin master --allow-unrelated-histories --recurse-submodules<CR>
nnoremap <buffer> + :<C-u>execute 'G push -u origin' fnamemodify(readfile(expand('%:p:h') . '/HEAD')[0], ':t')<CR>
nnoremap <buffer> _ :<C-u>G push -f<CR>
