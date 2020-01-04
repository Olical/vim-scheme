function! scheme#connect()
  if !exists('g:scheme_executable')
    let g:scheme_executable = "mit-scheme"
  endif

  if has('nvim')
    new
    let s:repl_term_id = termopen(g:scheme_executable)
  else
    let s:repl_term_id = term_start(g:scheme_executable)
  endif

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

  if !exists('s:repl_term_id')
    call scheme#connect()
  end

  if has("nvim")
    call jobsend(s:repl_term_id, @@ . "\n")
  else
    call term_sendkeys(s:repl_term_id, @@ . "\n")
  end

  let &selection = sel_save
  let @@ = reg_save
endfunction
