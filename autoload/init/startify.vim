function! init#startify#main() "{{{
	new
	if !exists('g:startify_custom_header')
		let g:startify_custom_header = cowsay#cowsay(fortune#fortune(), 'dragon-and-cow')
	endif
	Startify
endfunction "}}}

