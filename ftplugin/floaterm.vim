call init#map#main()

setlocal nowrap
setlocal scrolloff=0

if expand('%:p:t') ==# '!octave'
	if exists('$OCTAVERUNTIME')
		setlocal path+=$OCTAVERUNTIME
	elseif has('unix')
		setlocal path+=/usr/share/octave/5.1.0/m/**
	elseif has('win32')
		setlocal path+=C:/Program\ Files/octave/5.1.0/m/**
	endif
endif

if expand('%:p:t') ==# '!zsh'
	setlocal path+=/etc/portage/package.use/**
endif

nnoremap <buffer> ZQ i<C-u><C-d>
nnoremap <buffer> ZZ :<C-u>hide<CR>
nnoremap <buffer> o :<C-u>execute 'wincmd W\|'.expand('<cword>')<CR>
nnoremap <buffer> c :<C-u>cd <cfile><CR>
xnoremap <buffer> c y:cd <C-r>0<CR>
nnoremap <buffer> x :<C-u>Defx `expand('<cfile>')`<CR>
xnoremap <buffer> x y:Defx <C-r>0<CR>
nnoremap <buffer> s :<C-u>split <cfile><CR>
xnoremap <buffer> s y:<C-u>split <C-r>0<CR>
nnoremap <buffer> p i<C-w>"+
nnoremap <buffer> P i<C-w>"
tnoremap <nowait> <C-w> <C-w>.
tnoremap <C-[> <C-w>N
tnoremap <C-\> <C-w>
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

