function! init#quickui#defx#main() "{{{
	if !exists('s:defx_list') || !exists('s:defx_opt')
		let s:defxs = {
					\ ' &d': $HOME.'/Documents',
					\ ' &q': $QQWORKSPACE,
					\ ' &;': $HOME.'/.local/share/Trash/files',
					\ ' &u': $UDISK,
					\ ' &.': '/mnt/cdrom',
					\ ' &v': $VIMCONFIG,
					\ ' &p': '/etc/portage/package.use',
					\ ' &r': $GITHUBWORKSPACE.'/'.$GITNAME,
					\ ' &i': $GITWORKSPACE.'/.cache/init.vim/.dein',
					\ ' &t': $HOME.'/.texlive/texmf-var/tex/latex',
					\ ' &o': $HOME.'/.local/share/fonts',
					\ ' &F': $FONTS,
					\ ' &a': $HOME.'/.local/share/applications',
					\ ' &b': $APPLICATIONS,
					\ ' &x': $HOME.'/.local/share/gnome-shell/extensions',
					\ }
		let s:defx_list = []
		for [s:defx_key, s:defx_value] in items(s:defxs)
			let s:defx_list += [[s:defx_key.'→'.s:defx_value, 'Defx '.s:defx_value]]
		endfor
		let s:defx_opt = {
					\ 'title': 'Defx',
					\ }
	endif
	call quickui#listbox#open(s:defx_list, s:defx_opt)
endfunction "}}}

