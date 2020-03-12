if !exists('b:trailguide')
	let b:trailguide = 0
	TrailGuide hide
endif

call init#map#main()

nmap <buffer> <C-w>o <C-w>o<Plug>(calendar_redraw)
nunmap <buffer> <Tab>
nunmap <buffer> gh
nunmap <buffer> gl
nunmap <buffer> gH
nunmap <buffer> g<C-H>
nunmap <buffer> q
nunmap <buffer> Q
nunmap <buffer> t
nunmap <buffer> E
nunmap <buffer> T
nunmap <buffer> <C-j>
nunmap <buffer> <C-k>
nunmap <buffer> <C-h>
nunmap <buffer> <C-l>
nunmap <buffer> <Space>
nmap <buffer> <LocalLeader> <Plug>(calendar_task)
nmap <buffer> <CR> <Plug>(calendar_event)
nmap <buffer> H <Plug>(calendar_view_left)
nmap <buffer> L <Plug>(calendar_view_right)
nmap <buffer> J <Plug>(calendar_tab)
nmap <buffer> K <Plug>(calendar_shift_tab)
nmap <buffer> c <Plug>(calendar_change_line)
nmap <buffer> x <Plug>(calendar_delete_line)
nmap <buffer> + <Plug>(calendar_undo_line)
nmap <buffer> = <Plug>(calendar_today)
nmap <buffer> ~ <Plug>(calendar_clear)
nmap <buffer> <M-q> <Plug>(calendar_hide)
nmap <buffer> <C-q> <Plug>(calendar_exit)

