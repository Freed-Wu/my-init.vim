call vimtex#init()

setlocal foldmethod=syntax
setlocal makeprg=octave\ %:p
setlocal keywordprg=:Help
setlocal iskeyword-=:
if exists('$OCTAVEFORGE')
	setlocal runtimepath+=$OCTAVERUNTIME/**2
	execute 'nnoremap <buffer> <LocalLeader>lf :<C-u>Leaderf file '.$OCTAVEFORGE.' --input=.m<CR>'
elseif has('unix')
	setlocal runtimepath+=$HOME/octave/**2
	execute 'nnoremap <buffer> <LocalLeader>lf :<C-u>Leaderf file '.$HOME.'/octave --input=.m<CR>'
elseif has('win32')
	setlocal runtimepath+=C:/Program\ Files/octave-5.1.0-w64/mingw64/share/octave/packages/**2
	nnoremap <buffer> <LocalLeader>lf :<C-u>Leaderf file C:/Program\ Files/octave-5.1.0-w64/mingw64/share/octave/packages --input=.m<CR>
endif
if exists('$OCTAVERUNTIME')
	execute 'nnoremap <buffer> <LocalLeader>lF :<C-u>Leaderf file '.$OCTAVERUNTIME.' --input=.m<CR>'
elseif has('unix')
	nnoremap <buffer> <LocalLeader>lF :<C-u>Leaderf file /usr/share/octave/5.1.0/m --input=.m<CR>
elseif has('win32')
	nnoremap <buffer> <LocalLeader>lF :<C-u>Leaderf file C:/Program\ Files/octave-5.1.0-w64/mingw64/share/octave/5.1.0/m --input=.m<CR>
endif

nnoremap <buffer> gs :split ~/.octaverc<CR>
nnoremap <buffer> gS :split ~/.config/octave/qt-settings<CR>
inoremap <buffer> .* <Space>.*<Space>
inoremap <buffer> ./ <Space>./<Space>
inoremap <buffer> .\ <Space>.\<Space>
inoremap <buffer> .^ <Space>.^<Space>

