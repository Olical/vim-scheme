function! scheme#connect()
  new
  let s:repl_term_id = termopen('mit-scheme')

  if g:scheme_split_size != "default"
    silent execute "resize " . g:scheme_split_size
  endif

  normal! G
endfunction

function! scheme#eval(type)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0
    silent exe "normal! `<" . a:type . "`>y"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]y"
  else
    silent exe "normal! `[v`]y"
  endif

  call jobsend(s:repl_term_id, @@ . "\n")

  let &selection = sel_save
  let @@ = reg_save
endfunction

