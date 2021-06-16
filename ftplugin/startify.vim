let g:which_key_map_startify_dot = {
			\ 'name': 'choose a key about mru & directory',
			\ }

for s:startify_commands in get(g:, 'startify_commands', [])
	for [s:startify_command_key, s:startify_command] in items(s:startify_commands)
		if s:startify_command_key[0] ==# '.'
			let g:which_key_map_startify_dot = extend(g:which_key_map_startify_dot, {s:startify_command_key[1]: s:startify_command})
		elseif s:startify_command_key[0] !=# g:maplocalleader
			execute 'let g:which_key_map_startify_'.s:startify_command_key[0].' = extend(g:which_key_map_startify_'.s:startify_command_key[0].', {s:startify_command_key[1]: s:startify_command})'
		endif
	endfor
endfor

for b:startify_bookmarks in get(g:, 'startify_bookmarks', [])
	for [b:startify_bookmark_key, b:startify_bookmark] in items(b:startify_bookmarks)
		let b:which_key_map_localleader = extend(get(b:, 'which_key_map_localleader', copy(g:which_key_map_localleader)), {b:startify_bookmark_key[1]: b:startify_bookmark})
	endfor
endfor

augroup startify "{{{
	autocmd!
	autocmd User Startified call s:startify()
augroup END "}}}
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
	nunmap <buffer> n
	nunmap <buffer> N
	nmap <buffer> o <plug>(startify-open-buffers)
	nnoremap <nowait><buffer> . :<C-u>WhichKey '.'<CR>
	nnoremap <buffer> i :call startify#set_mark('B')<CR>j
	nnoremap <buffer> s :call startify#set_mark('S')<CR>j
	nnoremap <buffer> I :call startify#set_mark('T')<CR>j
	nnoremap <buffer> S :call startify#set_mark('V')<CR>j
	nnoremap <buffer> gi :call startify#set_batchmode('B')<CR>j
	nnoremap <buffer> gs :call startify#set_batchmode('S')<CR>j
	nnoremap <buffer> gI :call startify#set_batchmode('T')<CR>j
	nnoremap <buffer> gS :call startify#set_batchmode('V')<CR>j
	nnoremap <buffer> [[ ?<C-r>=join(b:startify_lists, '\\|')<CR><CR>:let @/=''<CR>
	nnoremap <buffer> ]] /<C-r>=join(b:startify_lists, '\\|')<CR><CR>:let @/=''<CR>
	nnoremap <buffer> [] ?<C-r>=join(b:startify_lists, '\\|')<CR><CR>}:let @/=''<CR>
	nnoremap <buffer> ][ /<C-r>=join(b:startify_lists, '\\|')<CR><CR>{:let @/=''<CR>
endfunction "}}}

command! -buffer -nargs=* -complete=customlist,calendar#argument#complete
			\ Calendar call calendar#new(<q-args>.' -position=here')
command! -buffer -nargs=? Splash enew
			\| call splash#command(<q-args>)

setlocal nowrap
setlocal nonumber
setlocal norelativenumber
setlocal buftype=nofile
setlocal shiftwidth=3
setlocal tabstop=3
setlocal expandtab
setlocal foldlevel=9
AnyFoldActivate
" call glyph_palette#apply()

let b:startify_lists = []
for b:startify_list in g:startify_lists
	let b:startify_lists += [b:startify_list['header'][0]]
endfor
