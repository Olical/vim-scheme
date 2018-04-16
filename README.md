# vim-scheme

> Warning: Currently depends on [vim-sexp][] for grabbing forms, you could quite easily change this yourself if it's a dealbreaker.

This plugin allows you to evaluate [Scheme][] from within your buffer. It delegates evaluation to an [mit-scheme][] REPL started by a Neovim `:terminal` command.

> Note: There's no reason why this can't work with normal Vim as far as I know, it just probably needs a little tweaking. Feel free to give it a shot!

I wrote this tool to help me work through [SICP][], I thought I'd put it out there for use by other Lisp enthusiasts that can't (or won't) leave their beloved modal environment of choice.

Since I'm a [Clojure][] developer by day (and night), I named the commands and bindings after [vim-fireplace][].

## Installation

Use your favourite plugin manager, mine is [vim-plug][].

```viml
Plug 'Olical/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }

" You'll need vim-sexp too for selecting forms.
Plug 'guns/vim-sexp'

" And while you're here, tpope's bindings make vim-sexp a little nicer to use.
Plug 'tpope/vim-sexp-mappings-for-regular-people'
```

## Usage

The plugin defines the following things:

 * `:SchemeConnect` which starts a REPL in a terminal buffer.
 * `:SchemeEval` which takes a range (defaulting to the whole file), it sends the range to the REPL and executes it.
 * `cp{motion...}` evaluates the result of the motion, so `cpaf` is the current form your cursor is on.
 * `cpp` is a shorthand version of `cpaf`, can come in pretty handy.

There's no other bindings but I define these in my own dotfiles, you may want them too. I didn't want to put them in by default since some people, understandably, hate that.

```viml
" Starts the REPL.
autocmd FileType scheme nnoremap <buffer> <localleader>rc :SchemeConnect<cr>

" Evaluates the outer most / top level form and jumps the cursor back to where it was.
autocmd FileType scheme nnoremap <buffer> <localleader>re :normal cpaF<cr>``

" Evaluate the entire file.
autocmd FileType scheme nnoremap <buffer> <localleader>rf :SchemeEval<cr>
```

I set my local leader to comma, so I would press `,re` to evaluate my current outermost form.

## Unlicenced

Find the full [unlicense][] in the `UNLICENSE` file, but here's a snippet.

>This is free and unencumbered software released into the public domain.
>
>Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

Do what you want. Learn as much as you can. Unlicense more software.

[unlicense]: http://unlicense.org/
[scheme]: https://en.wikipedia.org/wiki/Scheme_(programming_language)
[clojure]: https://clojure.org/
[mit-scheme]: https://www.gnu.org/software/mit-scheme/
[sicp]: https://mitpress.mit.edu/sites/default/files/sicp/index.html
[vim-sexp]: https://github.com/guns/vim-sexp
[vim-fireplace]: https://github.com/tpope/vim-fireplace
