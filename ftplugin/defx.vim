setlocal norelativenumber
setlocal nonumber
setlocal tabstop=2
setlocal shiftwidth=2
setlocal splitright

let b:trailguide = 0
TrailGuide hide
IndentLinesEnable

nmap <buffer> [[ <Plug>(defx-git-prev)
nmap <buffer> ]] <Plug>(defx-git-next)
nmap <nowait><buffer> > <Plug>(defx-git-stage)
nmap <nowait><buffer> < <Plug>(defx-git-reset)
nmap <buffer> g~ <Plug>(defx-git-discard)

nnoremap <buffer><expr> gx
			\ defx#do_action('execute_system')
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
nnoremap <buffer><expr> gs
			\ defx#do_action('toggle_select_all')
xnoremap <buffer><expr> gs
			\ defx#do_action('toggle_select_visual') . defx#do_action('toggle_select_all')
nnoremap <nowait><buffer><expr> gq
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
nnoremap <buffer><expr> C
			\ defx#do_action('link')
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
nnoremap <buffer><expr> gQ
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('multi', [['drop', 'PdftkDump'], 'quit'])
nnoremap <buffer><expr> Q
			\ defx#is_directory() ?
			\ defx#do_action('drop') :
			\ defx#do_action('drop', 'PdftkDump')
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
nnoremap <buffer><expr> crQ
			\ defx#do_action('open', 'PdftkDump')
nnoremap <buffer><expr> <C-p>
			\ defx#do_action('preview')

nnoremap <buffer><expr> J
			\ defx#do_action('cd', getcwd())
nnoremap <buffer><expr> gu
			\ defx#do_action('cd', '..')
nnoremap <buffer><expr> gU
			\ defx#do_action('cd', '/')
nnoremap <buffer><expr> ~
			\ defx#do_action('cd')
nnoremap <buffer><expr> gJ
			\ defx#do_action('cd', input('cd ', '', 'customlist,defx#util#complete'))
nnoremap <nowait><buffer><expr> -
			\ defx#do_action('cd', g:defx#_histories[-1][1])
nnoremap <nowait><buffer><expr> +
			\ defx#do_action('add_session')
nnoremap <nowait><buffer><expr> _
			\ defx#do_action('toggle_ignored_files')

nnoremap <buffer><expr> ysp
			\ defx#do_action('yank_path', ':~')
nnoremap <buffer><expr> yap
			\ defx#do_action('yank_path')
nnoremap <buffer><expr> yip
			\ defx#do_action('yank_path', ':.')
nnoremap <buffer><expr> yss
			\ defx#do_action('yank_path', ':t')
nnoremap <buffer><expr> yas
			\ defx#do_action('yank_path', ':e')
nnoremap <buffer><expr> yis
			\ defx#do_action('yank_path', ':t:r')

nnoremap <nowait><buffer> = :<C-u>call quickui#listbox#open(b:content_toggle, {})<CR>
let b:content_toggle = [
			\ ['&Extension', 'call defx#call_action("multi", [["toggle_sort", "extension"], "redraw"])'],
			\ ['&Filename', 'call defx#call_action("multi", [["toggle_sort", "filename"], "redraw"])'],
			\ ['&Size', 'call defx#call_action("multi", [["toggle_sort", "size"], "redraw"])'],
			\ ['&Time', 'call defx#call_action("multi", [["toggle_sort", "time"], "redraw"])'],
			\ ]

nnoremap <buffer><expr> !
			\ defx#do_action('execute_command')
nnoremap <nowait><buffer> <LocalLeader> :<C-u>call quickui#context#open(b:content, {})<CR>
let b:content = map([
			\ ['&Adb push', 'call defx#call_action("execute_command", "adb push % /sdcard/Download")'],
			\ ['&Bluetooth-sendto', 'call defx#call_action("execute_command", "bluetooth-sendto %")'],
			\ ['&Convert png', 'call defx#call_action("execute_command", "convert % %.png")'],
			\ ['&Git init', 'call defx#call_action("execute_command", "git init %")'],
			\ ['&Soffice convert-to pdf', 'call defx#call_action("execute_command", "soffice --convert-to pdf %")'],
			\ ['&Vd', 'call defx#call_action("execute_command", "vd -b % -o %.tsv")'],
			\ ['7z &x', 'call defx#call_action("execute_command", "7z x % -otemp")'],
			\ ['7&z a', 'call defx#call_action("execute_command", "7z a %.7z %")'],
			\ ['&Pdfcrop', 'call defx#call_action("execute_command", "pdfcrop %")'],
			\ ['Pdfto&text', 'call defx#call_action("execute_command", "pdftotext %")'],
			\ ['Pdf&2svg', 'call defx#call_action("execute_command", "pdf2svg % %.svg")'],
			\ ] , {_, v -> v + [get(split(get(v, 1), '"'), -2)]})

command! -buffer -nargs=* -range -bar -complete=customlist,defx#util#complete
			\ Defx split
			\| call defx#util#call_defx('Defx', '-split=no '.<q-args>)
