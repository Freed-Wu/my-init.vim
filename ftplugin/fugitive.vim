let g:which_key_map_fugitive_c = {
			\ 'name': "choose a key about commit",
			\ }
let g:which_key_map_fugitive_d = {
			\ 'name': "choose a key about diff",
			\ }
let g:which_key_map_fugitive_r = {
			\ 'name': "choose a key about rebase",
			\ }

call which_key#register('c', "g:which_key_map_fugitive_c")
call which_key#register('d', "g:which_key_map_fugitive_d")
call which_key#register('r', "g:which_key_map_fugitive_r")

nnoremap <buffer><nowait> c :<C-u>WhichKey 'c'<CR>
nnoremap <buffer><nowait> d :<C-u>WhichKey 'd'<CR>
nnoremap <buffer><nowait> r :<C-u>WhichKey 'r'<CR>
nnoremap <buffer> <LocalLeader>a :G remote add origin git@github.com:Freed-Wu/.git<Left><Left><Left><Left>
nnoremap <buffer> <LocalLeader>p :G pull origin master --allow-unrelated-histories<CR>
nnoremap <buffer> <LocalLeader>cm :G checkout master<CR>
nnoremap <buffer> <LocalLeader>bd :G checkout -b dev<CR>
nnoremap <buffer> <LocalLeader>bf :G checkout -b feature-
nnoremap <buffer> <LocalLeader>br :G checkout -b release-
nnoremap <buffer> <LocalLeader>bg :G checkout -b bug-
nnoremap <buffer> <LocalLeader>cd :G checkout dev<CR>
nnoremap <buffer> <LocalLeader>cf :G checkout feature-
nnoremap <buffer> <LocalLeader>cr :G checkout release-
nnoremap <buffer> <LocalLeader>cb :G checkout bug-
nnoremap <buffer> <LocalLeader>dd :G branch -d dev<CR>
nnoremap <buffer> <LocalLeader>df :G branch -d feature-
nnoremap <buffer> <LocalLeader>dr :G branch -d release-
nnoremap <buffer> <LocalLeader>db :G branch -d bug-
nnoremap <buffer> <LocalLeader>bb :G branch<CR>
nnoremap <buffer> <LocalLeader>tt :G tag v
nnoremap <buffer> <LocalLeader>tm :G tag -a v -m ""
nnoremap <buffer> <LocalLeader>td :G tag -d v

