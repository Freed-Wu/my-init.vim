let g:which_key_map_startify_dot = {
			\ 'name': "choose a key about mru & command",
			\ }

for s:startify_commands in g:startify_commands
	for [s:startify_command_key, s:startify_command] in items(s:startify_commands)
		if s:startify_command_key[0] == '.'
			let g:which_key_map_startify_dot = extend(g:which_key_map_startify_dot, {s:startify_command_key[1]: s:startify_command})
		else
			execute 'let g:which_key_map_startify_'.s:startify_command_key[0].' = extend(g:which_key_map_startify_'.s:startify_command_key[0].', {s:startify_command_key[1]: s:startify_command})'
		endif
	endfor
endfor

for b:startify_bookmarks in g:startify_bookmarks
	for [b:startify_bookmark_key, b:startify_bookmark] in items(b:startify_bookmarks)
		let b:which_key_map_localleader = extend(copy(g:which_key_map_localleader), {b:startify_bookmark_key[1]: b:startify_bookmark})
	endfor
endfor

call which_key#register('.', "g:which_key_map_startify_dot")
call init#map#main()

autocmd! User Startified call s:startify()
function! s:startify() "{{{
	unmap <buffer> b
	unmap <buffer> B
	unmap <buffer> s
	unmap <buffer> S
	unmap <buffer> t
	unmap <buffer> T
	unmap <buffer> v
	unmap <buffer> V
	unmap <buffer> e
	unmap <buffer> q
endfunction "}}}

command! -buffer -nargs=? Splash enew
			\| call splash#command(<q-args>)

setlocal nonumber
setlocal norelativenumber

nmap <buffer> n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
nmap <buffer> N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
nunmap <buffer> n
nunmap <buffer> N
nmap <buffer> a <plug>(startify-open-buffers)
nnoremap <nowait><buffer> . :<C-u>WhichKey '.'<CR>
nnoremap <buffer> o :call startify#set_mark('B')<CR>
nnoremap <buffer> i :call startify#set_mark('S')<CR>
nnoremap <buffer> O :call startify#set_mark('T')<CR>
nnoremap <buffer> I :call startify#set_mark('V')<CR>
nnoremap <buffer> go :call startify#set_batchmode('B')<CR>
nnoremap <buffer> gi :call startify#set_batchmode('S')<CR>
nnoremap <buffer> gO :call startify#set_batchmode('T')<CR>
nnoremap <buffer> gI :call startify#set_batchmode('V')<CR>
nnoremap <buffer> <Leader>hH :Deol -split=horizontal<CR>
nnoremap <buffer> <Leader>hh :Deol<CR>
nnoremap <buffer> <Leader>jC :Calendar -split=horizontal<CR>
nnoremap <buffer> <Leader>jc :Calendar<CR>

