call init#map#main()

command! -buffer -nargs=? Deol terminal

setlocal nowrap
setlocal scrolloff=0
setlocal path+=/etc/portage/package.use/**

if has('unix')
	nnoremap <buffer> <C-q> i<C-c><C-u><C-d>
else
	nnoremap <buffer> <C-q> :<C-u>quit!<CR>
endif
nnoremap <buffer> o :<C-u>execute 'wincmd W\|'.expand('<cword>')<CR>
nnoremap <buffer> c :<C-u>cd <cfile><CR>
xnoremap <buffer> c y:cd <C-r>0<CR>
nnoremap <buffer> x :<C-u>Defx `expand('<cfile>')`<CR>
xnoremap <buffer> x y:Defx <C-r>0<CR>
nnoremap <buffer> s :<C-u>split <cfile><CR>
xnoremap <buffer> s y:<C-u>split <C-r>0<CR>
nnoremap <buffer> p i<C-w>"+
nnoremap <buffer> P i<C-w>"
if !exists('g:terminal_map')
	tnoremap <C-w> <C-w>.
	tnoremap <C-\> <C-w><C-\>
	tnoremap <S-Esc> <C-w>
	nnoremap <S-Esc> <C-w>
	tnoremap <C-BS> <C-w>N
	tnoremap <C-Esc> <C-w>N
	tnoremap <S-Esc>m <C-w>:vnew<CR>
	tnoremap <S-Esc><Tab> <C-w>:tabnew<CR>
	tnoremap <M-0> <Esc>0
	tnoremap <M-1> <Esc>1
	tnoremap <M-2> <Esc>2
	tnoremap <M-3> <Esc>3
	tnoremap <M-4> <Esc>4
	tnoremap <M-5> <Esc>5
	tnoremap <M-6> <Esc>6
	tnoremap <M-7> <Esc>7
	tnoremap <M-8> <Esc>8
	tnoremap <M-9> <Esc>9
	tnoremap <M-a> <Esc>a
	tnoremap <M-b> <Esc>b
	tnoremap <M-c> <Esc>c
	tnoremap <M-d> <Esc>d
	tnoremap <M-e> <Esc>e
	tnoremap <M-f> <Esc>f
	tnoremap <M-g> <Esc>g
	tnoremap <M-h> <Esc>h
	tnoremap <M-i> <Esc>i
	tnoremap <M-j> <Esc>j
	tnoremap <M-k> <Esc>k
	tnoremap <M-l> <Esc>l
	tnoremap <M-m> <Esc>m
	tnoremap <M-n> <Esc>n
	tnoremap <M-o> <Esc>o
	tnoremap <M-p> <Esc>p
	tnoremap <M-q> <Esc>q
	tnoremap <M-r> <Esc>r
	tnoremap <M-s> <Esc>s
	tnoremap <M-t> <Esc>t
	tnoremap <M-u> <Esc>u
	tnoremap <M-v> <Esc>v
	tnoremap <M-w> <Esc>w
	tnoremap <M-x> <Esc>x
	tnoremap <M-y> <Esc>y
	tnoremap <M-z> <Esc>z
	tnoremap <M-S-1> <Esc>!
	tnoremap <M-S-2> <Esc>@
	tnoremap <M-S-3> <Esc>#
	tnoremap <M-S-4> <Esc>$
	tnoremap <M-S-5> <Esc>%
	tnoremap <M-S-6> <Esc>^
	tnoremap <M-S-7> <Esc>&
	tnoremap <M-S-8> <Esc>*
	tnoremap <M-S-9> <Esc>(
	tnoremap <M-S-0> <Esc>)
	tnoremap <M-S-a> <Esc>A
	tnoremap <M-S-b> <Esc>B
	tnoremap <M-S-c> <Esc>C
	tnoremap <M-S-d> <Esc>D
	tnoremap <M-S-e> <Esc>E
	tnoremap <M-S-f> <Esc>F
	tnoremap <M-S-g> <Esc>G
	tnoremap <M-S-h> <Esc>H
	tnoremap <M-S-i> <Esc>I
	tnoremap <M-S-j> <Esc>J
	tnoremap <M-S-k> <Esc>K
	tnoremap <M-S-l> <Esc>L
	tnoremap <M-S-m> <Esc>M
	tnoremap <M-S-n> <Esc>N
	tnoremap <M-S-o> <Esc>O
	tnoremap <M-S-p> <Esc>P
	tnoremap <M-S-q> <Esc>Q
	tnoremap <M-S-r> <Esc>R
	tnoremap <M-S-s> <Esc>S
	tnoremap <M-S-t> <Esc>T
	tnoremap <M-S-u> <Esc>U
	tnoremap <M-S-v> <Esc>V
	tnoremap <M-S-w> <Esc>W
	tnoremap <M-S-x> <Esc>X
	tnoremap <M-S-y> <Esc>Y
	tnoremap <M-S-z> <Esc>Z
	let g:terminal_map = 1
endif
nnoremap <buffer> <Leader>jj :<C-u>Rooter<CR>:Defx `getcwd()`<CR><C-w>=

