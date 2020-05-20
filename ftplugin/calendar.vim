let b:trailguide = 0

TrailGuide hide

call init#map#main()

nmap <buffer> <C-w>o <C-w>o<Plug>(calendar_redraw)
nunmap <buffer> q
nunmap <buffer> Q
nmap <buffer> ZZ <Plug>(calendar_hide)
nmap <buffer> ZQ <Plug>(calendar_exit)
nunmap <buffer> t
nunmap <buffer> T
nunmap <buffer> E
nmap <buffer> . <Plug>(calendar_task)
nmap <buffer> <LocalLeader> <Plug>(calendar_event)
nunmap <buffer> <C-j>
nunmap <buffer> <C-k>
nunmap <buffer> n
nunmap <buffer> N
nmap <buffer> J <Plug>(calendar_move_down)
nmap <buffer> K <Plug>(calendar_move_up)
nunmap <buffer> <C-h>
nunmap <buffer> <C-l>
nunmap <buffer> <Space>
nmap <buffer> g: <Plug>(calendar_bar)
nmap <buffer> H <Plug>(calendar_view_left)
nmap <buffer> L <Plug>(calendar_view_right)
nmap <buffer> R <Plug>(calendar_clear)
nmap <buffer> x <Plug>(calendar_delete)
nmap <buffer> X <Plug>(calendar_delete_line)
nmap <nowait><buffer> = <Plug>(calendar_today)
nmap <buffer> ~ <Plug>(calendar_clear)

