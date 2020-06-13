if expand('%:e') ==# 'c'
	let b:fswitchdst = 'h'
	let b:fswitchlocs = '../inc'
elseif expand('%:e') ==# 'h'
	let b:fswitchdst = 'c'
	let b:fswitchlocs = '../src'
endif
let g:ale_c_clang_options = '-std=c11 -Wall -I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x -I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/CoreSupport -I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/STM32F10x_StdPeriph_Driver/inc'
let g:ale_c_clangtidy_options = '-I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x -I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/CoreSupport -I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/STM32F10x_StdPeriph_Driver/inc'
let g:ale_c_clangd_options = '-I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x -I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/CoreSupport -I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/STM32F10x_StdPeriph_Driver/inc'
let g:ale_c_gcc_options = '-std=c11 -Wall -I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x -I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/CoreSupport -I ~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/STM32F10x_StdPeriph_Driver/inc'

call c#map#main()

setlocal path+=~/.local/include/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/**
setlocal makeprg=clang\ %\ -o\ %<.exe
setlocal keywordprg=:Help

nnoremap <buffer><silent> <LocalLeader>ra :call C_MakeArguments()<CR>
nnoremap <buffer><silent> <LocalLeader>rc :call C_ChooseMakefile()<CR>
nnoremap <buffer> <silent> <LocalLeader>j i<C-R>=C_JumpCtrlJ()<CR>
inoremap <buffer> <silent> <LocalLeader>j <C-R>=C_JumpCtrlJ()<CR>

