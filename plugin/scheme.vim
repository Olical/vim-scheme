command! SchemeConnect call scheme#connect()

autocmd FileType scheme nnoremap <buffer> cp :set opfunc=scheme#eval<cr>g@
autocmd FileType scheme nnoremap <buffer> cpp :normal cpaf<cr>
