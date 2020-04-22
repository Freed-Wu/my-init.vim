if !exists('b:trailguide')
	let b:trailguide = 0
	TrailGuide hide
endif

call init#map#main()

nmap <buffer> [[ <Plug>(defx-git-prev)
nmap <buffer> ]] <Plug>(defx-git-next)
nmap <nowait><buffer> > <Plug>(defx-git-stage)
nmap <nowait><buffer> < <Plug>(defx-git-reset)
nmap <buffer> - <Plug>(defx-git-discard)
nmap <buffer> <Leader>he mzgggx`z
nnoremap <buffer><expr> gx
			\ defx#do_action('execute_system')
nnoremap <buffer><expr> !
			\ defx#do_action('execute_command')
nnoremap <buffer><expr> .
			\ defx#do_action('repeat')
nnoremap <buffer><expr> gf
			\ defx#do_action('search')
nnoremap <buffer><expr> R
			\ defx#do_action('redraw')
nnoremap <buffer><expr> ZQ
			\ defx#do_action('quit')
nnoremap <buffer><expr> <LocalLeader>e
			\ defx#do_action('multi', [['toggle_sort', 'extension'], 'redraw'])
nnoremap <buffer><expr> <LocalLeader>f
			\ defx#do_action('multi', [['toggle_sort', 'filename'], 'redraw'])
nnoremap <buffer><expr> <LocalLeader>s
			\ defx#do_action('multi', [['toggle_sort', 'size'], 'redraw'])
nnoremap <buffer><expr> <LocalLeader>t
			\ defx#do_action('multi', [['toggle_sort', 'time'], 'redraw'])
nnoremap <buffer><expr> <LocalLeader><LocalLeader>
			\ defx#do_action('toggle_ignored_files')
nnoremap <buffer><expr> s
			\ defx#do_action('toggle_select') . 'j'
nnoremap <buffer><expr> S
			\ defx#do_action('toggle_select') . 'k'
nnoremap <buffer><expr> gs
			\ defx#do_action('toggle_select_all')
xnoremap <buffer><expr> s
			\ defx#do_action('toggle_select_visual')
nnoremap <buffer><expr> gq
			\ defx#do_action('clear_select_all')
nnoremap <buffer><expr> za
			\ defx#do_action('open_or_close_tree')
nnoremap <buffer><expr> zo
			\ defx#do_action('open_tree')
nnoremap <buffer><expr> zO
			\ defx#do_action('open_tree_recursive')
nnoremap <buffer><expr> K
			\ defx#do_action('cd', ['..'])
nnoremap <buffer><expr> gK
			\ defx#do_action('cd', getcwd())
nmap <buffer> J :<C-u>cd -<CR>gK
nnoremap <buffer><expr> gJ
			\ defx#do_action('cd')
nnoremap <nowait><buffer><expr> =
			\ defx#do_action('change_vim_cwd')
nnoremap <buffer><expr> A
			\ defx#do_action('new_directory')
nnoremap <buffer><expr> a
			\ defx#do_action('new_file')
nnoremap <buffer><expr> P
			\ defx#do_action('print')
nnoremap <buffer><expr> C
			\ defx#do_action('yank_path')
nnoremap <buffer><expr> r
			\ defx#do_action('rename')
nnoremap <buffer><expr> c
			\ defx#do_action('copy')
nnoremap <buffer><expr> p
			\ defx#do_action('paste')
nnoremap <buffer><expr> x
			\ defx#do_action('move')
nnoremap <buffer><expr> X
			\ defx#do_action('remove_trash')
nnoremap <buffer><expr> <C-x>
			\ defx#do_action('remove')
xmap <buffer> P sP
xmap <buffer> C sC
xmap <buffer> r sr
xmap <buffer> c sc
xmap <buffer> x sx
xmap <buffer> X sX
xmap <buffer> <C-x> s<C-x>
if has('win32')
	nmap <buffer> <LocalLeader>x C:<C-u>call init#clean#main(split(@0, "\n"))<CR>R
endif

nnoremap <buffer><expr> o
			\ defx#is_directory() ?
			\ defx#do_action('open_or_close_tree') :
			\ defx#do_action('multi', ['drop', 'quit'])
nnoremap <buffer><expr> go
			\ defx#do_action('drop')
nnoremap <buffer><expr> i
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('multi', [['drop', 'split'], 'quit'])
nnoremap <buffer><expr> gi
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('drop', 'split')
nnoremap <buffer><expr> I
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
nnoremap <buffer><expr> gI
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('drop', 'vsplit')
nnoremap <buffer><expr> O
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('multi', [['drop', 'tab split'], 'quit'])
nnoremap <buffer><expr> gO
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('drop', 'tab split')
nnoremap <buffer><expr> <CR>
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('multi', [['drop', 'pedit'], 'quit'])
nnoremap <buffer><expr> <C-CR>
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('drop', 'pedit')
xmap <buffer> o so
xmap <buffer> O sO
xmap <buffer> i si
xmap <buffer> i si
xmap <buffer> go sgo
xmap <buffer> gO sgO
xmap <buffer> gi sgi
xmap <buffer> gi sgi

command! -buffer -nargs=* -range -bar -complete=customlist,defx#util#complete
			\ Defx wincmd n
			\| call defx#util#call_defx('Defx', '-split=no '.<q-args>)

