scriptencoding utf-8

let s:db = get(g:, 'leaderf#calibre#db_dir', expand('~/Calibre Library')) . '/metadata.db'
let s:temp_dir = get(g:, 'leaderf#calibre#temp_dir', has('unix') ? '/tmp' : $HOME . '/AppData/Local')

" load information of ebooks {{{ "
function! leaderf#calibre#sql(db, cmd) abort "{{{
	return split(system('echo .quit | sqlite3 -cmd "' . a:cmd . '" ' . substitute(a:db, ' ', '\\ ', 'g')), "\n")
endfunction "}}}

function! leaderf#calibre#get_books(db) abort "{{{
	return leaderf#calibre#sql(a:db, 'select * from books join data join languages where books.id = data.id = languages.id;')
endfunction "}}}

function! leaderf#calibre#get_tags(db, id) abort "{{{
	return leaderf#calibre#sql(a:db, 'select * from books_tags_link join tags where tags.id = books_tags_link.id and books_tags_link.book = ' . a:id . ';')
endfunction "}}}

function! leaderf#calibre#get_attr(infos, attr) abort "{{{
	if a:attr ==# 'id'
		return a:infos[0]
	elseif a:attr ==# 'title'
		return a:infos[1]
	elseif a:attr ==# 'isbn'
		return a:infos[5]
	elseif a:attr ==# 'author'
		return a:infos[6]
	elseif a:attr ==# 'dirname'
		return a:infos[9]
	elseif a:attr ==# 'filetype'
		return a:infos[16]
	elseif a:attr ==# 'basename'
		return tolower(a:infos[18])
	elseif a:attr ==# 'path'
		return get(g:, 'leaderf#calibre#db_dir', expand('~/Calibre Library')) . '/' .  a:infos[9] . '/' . a:infos[18] . '.' . tolower(a:infos[16])
	elseif a:attr ==# 'language'
		let l:map = get(g:, 'leaderf#calibre#languages_name', {'zho': '中'})
		return has_key(l:map, a:infos[-1]) ? l:map[a:infos[-1]] : a:infos[-1]
	elseif a:attr ==# 'tag'
		let l:tags = []
		for l:line in leaderf#calibre#get_tags(s:db, a:infos[0])
			let l:tags += [split(l:line, '|')[-1]]
		endfor
		return join(l:tags, get(g:, 'leaderf#calibre#seprator', ':'))
	endif
endfunction "}}}

function! leaderf#calibre#source(args) abort "{{{
	let l:lines = []
	let s:books = leaderf#calibre#get_books(s:db)
	for l:book in s:books
		let l:infos = split(l:book, '|')
		let l:attrs = []
		for l:attr in ['id'] + get(g:, 'leaderf#calibre#attr', ['title', 'author', 'tag'])
			let l:attrs += [leaderf#calibre#get_attr(l:infos, l:attr)]
		endfor
		let l:lines += [join(l:attrs, "\t")]
	endfor
	return l:lines
endfunction "}}}
" }}} load information of ebooks "

" operation on ebooks {{{ "
function! leaderf#calibre#accept(line, args) abort "{{{
	let l:id = split(a:line, "\t")[0]
	execute 'call leaderf#calibre#' . get(g:, 'leaderf#calibre#default', 'view') . "('" . l:id . "')"
endfunction "}}}

function! leaderf#calibre#id_to_path(id) abort "{{{
	for l:book in s:books
		let l:infos = split(l:book, '|')
		if leaderf#calibre#get_attr(l:infos, 'id') ==# a:id
			return leaderf#calibre#get_attr(l:infos, 'path')
		endif
	endfor
endfunction "}}}

function! leaderf#calibre#open(path) abort "{{{
	if has('win32')
		let l:cmd = "!start rundll32 url.dll,FileProtocolHandler '" . a:path . "'"
	elseif has('mac')
		let l:cmd = "open '" . a:path . "'"
	elseif executable('xdg-open')
		let l:cmd = "xdg-open '" . a:path . "'"
	endif
	call system(l:cmd)
endfunction "}}}

function! leaderf#calibre#view(id) abort "{{{
	let l:path = leaderf#calibre#id_to_path(a:id)
	call leaderf#calibre#open(l:path)
endfunction "}}}

function! leaderf#calibre#view_cover(id) abort "{{{
	let l:path = fnamemodify(leaderf#calibre#id_to_path(a:id), ':h') . '/cover.jpg'
	call leaderf#calibre#open(l:path)
endfunction "}}}

function! leaderf#calibre#open_path(id) abort "{{{
	let l:path = escape(fnamemodify(leaderf#calibre#id_to_path(a:id), ':h'), ' \')
	if exists('g:leaderf#calibre#explorer')
		execute g:leaderf#calibre#explorer . ' ' . l:path
	elseif exists(':Defx') == 2
		execute 'Defx ' . l:path
	elseif exists(':LeaderfFiler') == 2
		execute 'LeaderfFiler ' . l:path
	elseif exists(':CocCommand') == 2
		execute 'CocCommand explorer ' . l:path
	elseif exists(':Explore') == 2
		execute 'Explore ' . l:path
	elseif
		call leaderf#calibre#open(l:path)
	endif
endfunction "}}}

function! leaderf#calibre#yank_path(id) abort "{{{
	let l:path = leaderf#calibre#id_to_path(a:id)
	for l:reg in get(g:, 'leaderf#calibre#regs', ['0', '*', '+'])
		execute 'let @' . l:reg . " = '" . l:path . "'"
	endfor
endfunction "}}}

function! leaderf#calibre#dump(id) abort "{{{
	let l:path = leaderf#calibre#id_to_path(a:id)
	if exists(':PdftkDump') == 2
		execute 'PdftkDump ' . l:path
	else
		echohl WarningMsg
		echo 'Please install pdftk.vim firstly!'
		echohl None
	endif
endfunction "}}}

function! leaderf#calibre#calibredb(cmd) abort "{{{
	if executable('calibredb')
		call system('calibredb ' . a:cmd)
		return 1
	else
		echohl WarningMsg
		echo 'Please install calibredb firstly!'
		echohl None
		return 0
	endif
endfunction "}}}

function! leaderf#calibre#edit_opf(id) abort "{{{
	let l:temp = s:temp_dir . '/' . a:id . '.opf'
	if leaderf#calibre#calibredb('show_metadata --as-opf ' . a:id . ' > ' . l:temp)
		execute 'edit ' . l:temp
		let l:cmd = 'calibredb set_metadata ' . a:id . ' ' . l:temp
		augroup leaderf_calibre "{{{
			autocmd!
			execute 'autocmd VimLeave,BufLeave ' . l:temp . " call system('" . l:cmd . "')"
			execute 'autocmd VimLeave,BufLeave ' . l:temp . " call delete('" . l:temp . "')"
		augroup END "}}}
	endif
endfunction "}}}

function! leaderf#calibre#remove(id) abort "{{{
	call leaderf#calibre#calibredb('remove ' . a:id)
endfunction "}}}

function! leaderf#calibre#remove_premanent(id) abort "{{{
	call leaderf#calibre#calibredb('remove --premanent ' . a:id)
endfunction "}}}

function! leaderf#calibre#export(id) abort "{{{
	call leaderf#calibre#calibredb('export ' . a:id)
endfunction "}}}
" }}} operation on ebooks "
