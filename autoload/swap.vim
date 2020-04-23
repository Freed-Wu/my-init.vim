function! init#swap#main() "{{{
	execute 'normal! '.((&virtualedit =~# 'onemore' && col('.') ==# col('$') - 1)?'p':'P')
endfunction "}}}

