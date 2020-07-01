setlocal tabstop=2
setlocal shiftwidth=2
setlocal splitright

let b:trailguide = 0
TrailGuide hide
IndentLinesEnable

call init#map#main()

nmap <buffer> [[ <Plug>(defx-git-prev)
nmap <buffer> ]] <Plug>(defx-git-next)
nmap <nowait><buffer> > <Plug>(defx-git-stage)
nmap <nowait><buffer> < <Plug>(defx-git-reset)
nmap <buffer> ~ <Plug>(defx-git-discard)

nnoremap <buffer><expr> gx
			\ defx#do_action('execute_system')
nnoremap <buffer><expr> g!
			\ defx#do_action('execute_command')
nnoremap <buffer><expr> gG
			\ defx#do_action('change_vim_cwd')
nnoremap <buffer><expr> .
			\ defx#do_action('repeat')
nnoremap <buffer><expr> gf
			\ defx#do_action('search')
nnoremap <buffer><expr> R
			\ defx#do_action('redraw')
nnoremap <buffer><expr> ZQ
			\ defx#do_action('quit')

nnoremap <buffer><expr> s
			\ defx#do_action('toggle_select') . 'j'
nnoremap <buffer><expr> S
			\ defx#do_action('toggle_select') . 'k'
xnoremap <buffer><expr> s
			\ defx#do_action('toggle_select_visual')
nnoremap <buffer><expr> gq
			\ defx#do_action('toggle_select_all')
xnoremap <buffer><expr> gq
			\ defx#do_action('toggle_select_visual') . defx#do_action('toggle_select_all')
nnoremap <nowait><buffer><expr> Q
			\ defx#do_action('clear_select_all')

nnoremap <buffer><expr> za
			\ defx#do_action('open_tree', 'toggle')
nnoremap <buffer><expr> zo
			\ defx#do_action('open_tree')
nnoremap <buffer><expr> zc
			\ defx#do_action('close_tree')
nnoremap <buffer><expr> zO
			\ defx#do_action('open_tree', 'recursive')

nnoremap <buffer><expr> <C-a>
			\ defx#do_action('new_multiple_files')
nnoremap <buffer><expr> A
			\ defx#do_action('new_directory')
nnoremap <buffer><expr> a
			\ defx#do_action('new_file')
nnoremap <buffer><expr> gp
			\ defx#do_action('print')
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

nnoremap <buffer><expr> go
			\ defx#is_directory() ?
			\ defx#do_action('open_tree', 'toggle') :
			\ defx#do_action('multi', ['drop', 'quit'])
nnoremap <buffer><expr> o
			\ defx#is_directory() ?
			\ defx#do_action('open_tree', 'toggle') :
			\ defx#do_action('drop')
nnoremap <buffer><expr> gi
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('multi', [['drop', 'split'], 'quit'])
nnoremap <buffer><expr> i
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('drop', 'split')
nnoremap <buffer><expr> gI
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
nnoremap <buffer><expr> I
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('drop', 'vsplit')
nnoremap <buffer><expr> gO
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('multi', [['drop', 'tab split'], 'quit'])
nnoremap <buffer><expr> O
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('drop', 'tab split')
nnoremap <buffer><expr> gP
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('multi', [['drop', 'pedit'], 'quit'])
nnoremap <buffer><expr> P
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('drop', 'pedit')
nnoremap <buffer><expr> cro
			\ defx#do_action('open')
nnoremap <buffer><expr> cri
			\ defx#do_action('open', 'split')
nnoremap <buffer><expr> crI
			\ defx#do_action('open', 'vsplit')
nnoremap <buffer><expr> crO
			\ defx#do_action('open', 'tab split')
nnoremap <buffer><expr> crP
			\ defx#do_action('open', 'pedit')
nnoremap <buffer><expr> <C-p>
			\ defx#do_action('preview')

nnoremap <buffer><expr> =e
			\ defx#do_action('multi', [['toggle_sort', 'extension'], 'redraw'])
nnoremap <buffer><expr> =f
			\ defx#do_action('multi', [['toggle_sort', 'filename'], 'redraw'])
nnoremap <buffer><expr> =s
			\ defx#do_action('multi', [['toggle_sort', 'size'], 'redraw'])
nnoremap <buffer><expr> =t
			\ defx#do_action('multi', [['toggle_sort', 'time'], 'redraw'])
nnoremap <buffer><expr> ==
			\ defx#do_action('toggle_ignored_files')

nnoremap <buffer><expr> C
			\ defx#do_action('cd', getcwd())
nnoremap <buffer><expr> K
			\ defx#do_action('cd', '..')
nnoremap <buffer><expr> J
			\ defx#do_action('cd', input('cd ', '', 'customlist,defx#util#complete'))
nnoremap <buffer><expr> -
			\ defx#do_action('cd', g:defx#_histories[-1][1])
nnoremap <buffer><expr> +
			\ defx#do_action('add_session')

nnoremap <buffer><expr> yap
			\ defx#do_action('yank_path')
nnoremap <buffer><expr> yip
			\ defx#do_action('yank_path', ':t')
nnoremap <buffer><expr> yas
			\ defx#do_action('yank_path', ':e')
nnoremap <buffer><expr> yis
			\ defx#do_action('yank_path', ':t:r')

nnoremap <buffer><expr> <LocalLeader><LocalLeader>
			\ defx#do_action('call', 'defx#command#main')
nnoremap <buffer><expr> <LocalLeader>g
			\ defx#do_action('call', 'defx#git_init#main')
nnoremap <buffer><expr> <LocalLeader>z
			\ defx#do_action('call', 'defx#7z#main')
nnoremap <buffer><expr> <LocalLeader>s
			\ defx#do_action('call', 'defx#ssconvert#main')
nnoremap <buffer><expr> <LocalLeader>o
			\ defx#do_action('call', 'defx#soffice#main')
nnoremap <buffer><expr> <LocalLeader>p
			\ defx#do_action('call', 'defx#pdftk#main')
nnoremap <buffer><expr> <LocalLeader>c
			\ defx#do_action('call', 'defx#calibredb#main')
nnoremap <buffer><expr> <LocalLeader>f
			\ defx#do_action('call', 'defx#ffplay#main')

command! -buffer -nargs=* -range -bar -complete=customlist,defx#util#complete
			\ Defx split
			\| call defx#util#call_defx('Defx', '-split=no '.<q-args>)
