let b:clean = [
			\ '*.PrjPCBStructure', '*.PrjMbdStructure', '*.LIBPKG',
			\ '*.Dat', '"Status', 'Report.Txt"', '*.drc', '*.html',
			\ '*.Annotation', 'History', '__Preview', 'Project',
			\ 'Logs', 'for', '[A-Za-z_0-9]*'
			\ ]

if expand('%') =~ 'dein\.vim'
	setlocal foldmethod=marker
	nnoremap <buffer><silent> <LocalLeader>x yi':execute 'Defx '.g:repos_path.expand('/').expand(@0)<CR>
	nnoremap <buffer><silent> <LocalLeader>X yi':execute 'Utl openLink '.b:github_path.'/'.expand(@0)<CR>
	nnoremap <buffer><silent> <LocalLeader>o yi':execute g:split.' '.g:repos_path.expand('/').expand(@0).expand('/doc/').'*.txt'<CR>
	nnoremap <buffer><silent> <LocalLeader>O yi':execute g:split.' '.g:repos_path.expand('/').expand(@0).expand('/').'README*'<CR>
	nnoremap <buffer><silent> <LocalLeader>g yi':<C-u>execute g:split.' '.$MYVIMRC<CR>/<C-r>=substitute(@0, '/', '\\\/', 'g')<CR><CR>
	nnoremap <buffer><silent> <LocalLeader>m :execute getline(line('.'))<CR>
	xnoremap <buffer><silent> <LocalLeader>m :execute join(getline(line("'<"),line("'>")), "<Bar>")<CR>
	nnoremap <buffer><silent> <LocalLeader>i yi':execute 'highlight'.expand(@0) <CR>
	xnoremap <buffer><silent> <LocalLeader>i y:highlight <C-r>0<CR>
	nnoremap <buffer><silent> <LocalLeader>i :<C-u>execute 'echo'.expand(@0) <CR>
	xnoremap <buffer><silent> <LocalLeader>e y:echo <C-r>0<CR>
	nnoremap <buffer><silent> <LocalLeader>e :<C-u>execute 'echom'.expand(@0) <CR>
	xnoremap <buffer><silent> <LocalLeader>E y:echom <C-r>0<CR>
	nnoremap <buffer><silent> <LocalLeader>E :<C-u>execute 'echom'.expand(@0) <CR>
	nnoremap <buffer><silent> <LocalLeader>s :<C-u>execute 'set'.expand(@0) <CR>
	xnoremap <buffer><silent> <LocalLeader>s y:set <C-r>0<CR>
	nnoremap <buffer><silent> <LocalLeader>S :<C-u>echo has(expand('<cWORD>'))<CR>
	xnoremap <buffer><silent> <LocalLeader>S y:echo has('<C-r>0')<CR>
	nnoremap <buffer><silent> <LocalLeader>p :<C-u>echo hasmapto(expand('<cWORD>'))<CR>
	xnoremap <buffer><silent> <LocalLeader>p y:echo hasmapto('<C-r>0')<CR>
	nnoremap <buffer><silent> <LocalLeader>P :<C-u>echo mapcheck(expand('<cWORD>'))<CR>
	xnoremap <buffer><silent> <LocalLeader>P y:echo mapcheck('<C-r>0')<CR>
endif

setlocal indentexpr=GetGitconfigIndent()

