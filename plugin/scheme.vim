command! SchemeConnect call scheme#connect()
command! -range=% SchemeEval <line1>,<line2>call scheme#eval('range')

autocmd FileType scheme nnoremap <buffer> cp :set opfunc=scheme#eval<cr>g@
autocmd FileType scheme nnoremap <buffer> cpp :normal cpaf<cr>
