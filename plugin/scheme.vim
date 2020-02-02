command! SchemeConnect call scheme#connect()

let g:scheme_split_size = get(g:, "scheme_split_size", "default")

autocmd FileType scheme,racket nnoremap <buffer> cp :set opfunc=scheme#eval<cr>g@
autocmd FileType scheme,racket nnoremap <buffer> cpp :normal cpaf<cr>

autocmd FileType scheme,racket nnoremap <buffer> <localleader>rc :SchemeConnect<cr>
autocmd FileType scheme,racket nnoremap <buffer> <localleader>rr :call scheme#restart()<cr>
autocmd FileType scheme,racket nnoremap <buffer> <localleader>re :normal mscpaF<cr>`s
autocmd FileType scheme,racket nnoremap <buffer> <localleader>rf :normal msggcpG<cr>`s
