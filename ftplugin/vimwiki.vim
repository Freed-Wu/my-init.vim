let b:clean = ['*.html','*.css']

nmap <buffer> gs <Plug>Vimwiki2HTMLBrowse
nmap <buffer> gS <Plug>Vimwiki2HTML
nmap <buffer> <LocalLeader>g <Plug>VimwikiDiaryGenerateLinks
nmap <buffer> K <Plug>VimwikiGoBackLink
nmap <buffer> [m <Plug>VimwikiPrevLink
nmap <buffer> ]m <Plug>VimwikiNextLink
nmap <buffer> <LocalLeader>d <Plug>VimwikiDeleteLink
nmap <buffer> <Leader>vr <Plug>VimwikiRenameLink
nmap <buffer> <LocalLeader>k <Plug>VimwikiAddHeaderLevel
nmap <buffer> <LocalLeader>j <Plug>VimwikiRemoveHeaderLevel
nmap <buffer> <LocalLeader>= <Plug>VimwikiNormalizeLink
xmap <buffer> <LocalLeader>= <Plug>VimwikiNormalizeLinkVisual
nmap <buffer> gK <Plug>VimwikiGoToParentHeader
nmap <buffer> <LocalLeader>t <Plug>VimwikiToggleListItem
xmap <buffer> <LocalLeader>t <Plug>VimwikiToggleListItem
nmap <buffer> <LocalLeader>m <Plug>VimwikiRemoveSingleCB
nmap <buffer> <LocalLeader>M <Plug>VimwikiRemoveCBInList
xmap <buffer> <LocalLeader>m <Plug>VimwikiRemoveSingleCB
xmap <buffer> <LocalLeader>M <Plug>VimwikiRemoveCBInList
nmap <buffer> <LocalLeader>a <Plug>VimwikiIncrementListItem
xmap <buffer> <LocalLeader>a <Plug>VimwikiIncrementListItem
nmap <buffer> <LocalLeader>x <Plug>VimwikiDecrementListItem
xmap <buffer> <LocalLeader>x <Plug>VimwikiDecrementListItem
imap <buffer> <M-]> <Plug>VimwikiIncreaseLvlSingleItem
imap <buffer> <M-[> <Plug>VimwikiDecreaseLvlSingleItem
imap <buffer> <C-x>j <Plug>VimwikiListNextSymbol
imap <buffer> <C-x>k <Plug>VimwikiListPrevSymbol
imap <buffer> <C-x>m <Plug>VimwikiListToggle
nmap <buffer> <LocalLeader>] <Plug>VimwikiIncreaseLvlSingleItem
nmap <buffer> <LocalLeader>} <Plug>VimwikiIncreaseLvlWholeItem
nmap <buffer> <LocalLeader>[ <Plug>VimwikiDecreaseLvlSingleItem
nmap <buffer> <LocalLeader>{ <Plug>VimwikiDecreaseLvlWholeItem
xmap <buffer> <LocalLeader>] <Plug>VimwikiIncreaseLvlSingleItem
xmap <buffer> <LocalLeader>} <Plug>VimwikiIncreaseLvlWholeItem
xmap <buffer> <LocalLeader>[ <Plug>VimwikiDecreaseLvlSingleItem
xmap <buffer> <LocalLeader>{ <Plug>VimwikiDecreaseLvlWholeItem
nmap <buffer> <LocalLeader>r <Plug>VimwikiRenumberList
nmap <buffer> <LocalLeader>R <Plug>VimwikiRenumberAllLists
noremap <buffer> <LocalLeader>y* :VimwikiChangeSymbolTo *<CR>
noremap <buffer> <LocalLeader>Y* :VimwikiChangeSymbolInListTo *<CR>
noremap <buffer> <LocalLeader>y# :VimwikiChangeSymbolTo #<CR>
noremap <buffer> <LocalLeader>Y# :VimwikiChangeSymbolInListTo #<CR>
noremap <buffer> <LocalLeader>y- :VimwikiChangeSymbolTo -<CR>
noremap <buffer> <LocalLeader>Y- :VimwikiChangeSymbolInListTo -<CR>
noremap <buffer> <LocalLeader>y. :VimwikiChangeSymbolTo 1.<CR>
noremap <buffer> <LocalLeader>Y. :VimwikiChangeSymbolInListTo 1.<CR>
noremap <buffer> <LocalLeader>ya :VimwikiChangeSymbolTo a)<CR>
noremap <buffer> <LocalLeader>Ya :VimwikiChangeSymbolInListTo a)<CR>
noremap <buffer> <LocalLeader>yA :VimwikiChangeSymbolTo A)<CR>
noremap <buffer> <LocalLeader>YA :VimwikiChangeSymbolInListTo A)<CR>
noremap <buffer> <LocalLeader>yi :VimwikiChangeSymbolTo i)<CR>
noremap <buffer> <LocalLeader>Yi :VimwikiChangeSymbolInListTo i)<CR>
noremap <buffer> <LocalLeader>yI :VimwikiChangeSymbolTo I)<CR>
noremap <buffer> <LocalLeader>YI :VimwikiChangeSymbolInListTo I)<CR>
nmap <buffer> <LocalLeader>T <Plug>VimwikiToggleRejectedListItem
xmap <buffer> <LocalLeader>T <Plug>VimwikiToggleRejectedListItem
xnoremap <buffer> iL :<C-U>call vimwiki#lst#TO_list_item(1, 1)<CR>
onoremap <buffer> iL :<C-U>call vimwiki#lst#TO_list_item(1, 0)<CR>
xnoremap <buffer> im :<C-U>call vimwiki#base#TO_table_cell(1, 1)<CR>
onoremap <buffer> im :<C-U>call vimwiki#base#TO_table_cell(1, 0)<CR>
nmap <buffer> <LocalLeader>h <Plug>VimwikiTableMoveColumnLeft
nmap <buffer> <LocalLeader>h <Plug>VimwikiTableMoveColumnRight
nmap <buffer> [M <Plug>VimwikiDiaryPrevDay
nmap <buffer> ]M <Plug>VimwikiDiaryNextDay

