let b:trailguide = 0

TrailGuide hide

nunmap <buffer> <C-j>
nunmap <buffer> <C-k>
nunmap <buffer> <C-h>
nunmap <buffer> <C-l>
nunmap <buffer> <Space>
nunmap <buffer> q
nunmap <buffer> Q
nunmap <buffer> t
nunmap <buffer> T
nunmap <buffer> E
nmap <buffer> R <Plug>(calendar_redraw)
nmap <nowait><buffer> <C-r> :<C-u>execute 'vertical resize '.(winwidth(0) == &columns / 2? &columns / 4: &columns / 2)<CR><Plug>(calendar_redraw)
nmap <buffer> <C-w>o <C-w>o<Plug>(calendar_redraw)
nmap <buffer> H <Plug>(calendar_view_left)
nmap <buffer> L <Plug>(calendar_view_right)
nmap <buffer> K <Plug>(calendar_up_large)
nmap <buffer> J <Plug>(calendar_down_large)
nmap <buffer> ZZ <Plug>(calendar_hide)
nmap <buffer> ZQ <Plug>(calendar_exit)
nmap <buffer> <C-x> <Plug>(calendar_clear)
nmap <nowait><buffer> = <Plug>(calendar_today)
nmap <buffer> p <Plug>(calendar_event)
nmap <buffer> P <Plug>(calendar_task)
nunmap <buffer> y
nmap <buffer> d <Plug>(calendar_delete_line)
nmap <buffer> c <Plug>(calendar_change_line)
nmap <buffer> u <Plug>(calendar_undo_line)
