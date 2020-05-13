if exists('g:loaded_%FILE%') || &cpoptions
  finish
endif
let g:loaded_%FILE% = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

%HERE%

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions

