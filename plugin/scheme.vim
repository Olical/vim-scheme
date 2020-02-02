command! SchemeConnect call scheme#connect()

let g:scheme_split_size = get(g:, "scheme_split_size", "default")

autocmd FileType scheme,racket nnoremap <buffer> cp :set opfunc=scheme#eval<cr>g@
autocmd FileType scheme,racket nnoremap <buffer> cpp :normal cpaf<cr>
autocmd FileType scheme,racket nnoremap <buffer> crr :call scheme#restart()<cr>
