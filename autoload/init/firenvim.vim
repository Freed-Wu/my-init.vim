function! init#firenvim#main() abort "{{{
	if exists('g:started_by_firenvim')
		set laststatus=0
		set showtabline=0
		set background=light
		nnoremap <C-\> :<C-u>call firenvim#focus_page()<CR>
		nnoremap <C-z> :<C-u>call firenvim#hide_frame()<CR>
	endif
endfunction "}}}
