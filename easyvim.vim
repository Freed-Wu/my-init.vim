let g:rsi_no_meta = 1
source <sfile>:p:h/init.vim
source $VIMRUNTIME/evim.vim
let g:NERDTreeQuitOnOpen = 0
let g:yankring_window_auto_close = 0
augroup easyvim "{{{
	autocmd!
	autocmd VimEnter * call s:easyvim()
augroup END "}}}
function! s:easyvim() "{{{
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	set guioptions+=m " 隐藏菜单栏
	set guioptions+=T " 隐藏工具栏
	set guioptions+=l " 隐藏左侧滚动条
	set guioptions+=r " 隐藏右侧滚动条
	set guioptions+=b " 隐藏底部滚动条
	Startify
	Defx
	YRShow
	wincmd h
endfunction "}}}

