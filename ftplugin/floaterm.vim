scriptencoding utf-8

setlocal nonumber
setlocal norelativenumber
setlocal nowrap
setlocal scrolloff=0
setlocal nofoldenable
setlocal colorcolumn=
setlocal nocursorline
setlocal nocursorcolumn

if expand('%:p:t') ==# '!octave'
	if exists('$OCTAVERUNTIME')
		setlocal path+=$OCTAVERUNTIME
	elseif has('unix')
		setlocal path+=/usr/share/octave/5.1.0/m/**
	elseif has('win32')
		setlocal path+=C:/Program\ Files/octave/5.1.0/m/**
	endif
endif

if expand('%:p:t') ==# '!zsh'
	setlocal path+=/etc/portage/package.use/**
endif

if expand('%:p:t') ==# '!mysql'
	setlocal path+=/var/lib/mysql/**
endif

nnoremap <buffer> ZQ i<C-u><C-d>
nnoremap <buffer> ZZ :<C-u>hide<CR>
nnoremap <buffer> o :<C-u>execute 'wincmd W\|'.expand('<cword>')<CR>
nnoremap <buffer> O :<C-u>execute 'wincmd W\|/'.expand('<cword>')<CR>
nnoremap <buffer> J i<C-p><CR>
nnoremap <buffer> [[ ?❯<CR>:let @/ = ''<CR>
nnoremap <buffer> ]] /❯<CR>:let @/ = ''<CR>
nnoremap <buffer> [] /❯<CR>:let @/ = ''<CR>2k
nnoremap <buffer> [] ?❯<CR>:let @/ = ''<CR>2j
if has('nvim')
	nnoremap <buffer> p i<C-\><C-N>"+pi
	nnoremap <buffer> <expr> P 'i<C-\><C-N>"'.nr2char(getchar()).'pi'
else
	nnoremap <buffer> p i<C-w>"+
	nnoremap <buffer> P i<C-w>"
endif
if exists('g:terminal_map')
	finish
endif
let g:terminal_map = 1
if has('nvim')
	tnoremap <Esc> <C-\><C-N>
	finish
endif
tnoremap <nowait> <C-w> <C-w>.
tnoremap <Esc> <C-w>N
if has('gui_running')
	for s:i in range(char2nr('0'), char2nr('9')) + range(char2nr('a'), char2nr('z'))
		execute 'tnoremap <M-' . nr2char(s:i) . '> <Esc>' . nr2char(s:i)
	endfor
	let s:map = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')']
	for s:i in range(10)
		execute 'tnoremap <M-S-' . s:i . '> <Esc>' . s:map[s:i]
	endfor
	for s:i in range(char2nr('a'), char2nr('z'))
		execute 'tnoremap <M-S-' . nr2char(s:i) . '> <Esc><S-' . nr2char(s:i) . '>'
	endfor
else
	for s:i in range(char2nr('0'), char2nr('9')) + range(char2nr('a'), char2nr('z')) + range(char2nr('A'), char2nr('Z'))
		execute 'tnoremap <Esc>' . nr2char(s:i) . ' <Esc>' . nr2char(s:i)
	endfor
	for s:i in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')']
		execute 'tnoremap <Esc>' . s:i . ' <Esc>' . s:i
	endfor
endif
