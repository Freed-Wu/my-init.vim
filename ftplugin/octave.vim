if expand('%:') =~# '.*tab.*plot\.m'
	nnoremap <buffer> <LocalLeader>b gg:/fpath<CR>f'<C-w>f
endif

call vimtex#init()

setlocal foldmethod=syntax
setlocal makeprg=octave\ %:p
setlocal keywordprg=:Help
setlocal fileencoding=utf-8
if exists('$OCTAVERUNTIME')
	setlocal runtimepath+=$OCTAVERUNTIME/**2
elseif has('unix')
	setlocal runtimepath+=$HOME/octave/**2
elseif has('win32')
	setlocal runtimepath+=C:/Program\ Files/octave-5.1.0-w64/mingw64/share/octave/packages/**2
endif

nnoremap <buffer> gs :split ~/.octaverc<CR>
nnoremap <buffer> gS :split ~/.config/octave/qt-settings<CR>
inoremap <buffer> .* <Space>.*<Space>
inoremap <buffer> ./ <Space>./<Space>
inoremap <buffer> .\ <Space>.\<Space>
inoremap <buffer> .^ <Space>.^<Space>

