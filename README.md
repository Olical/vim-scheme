# vim-scheme

> Warning: Currently depends on [vim-sexp][] for selecting forms.

This plugin allows you to evaluate [Scheme][] from within your buffer. It delegates evaluation to an [mit-scheme][] REPL started by a Neovim `:terminal` command.

> Note: There's no reason why this can't work with normal Vim as far as I know, it just needs a little tweaking. Pull requests are more than welcome.

I wrote this tool to make working through [SICP][] easier, I thought I'd put it out there for use by other Lisp enthusiasts that can't (or won't) leave their beloved modal environment of choice.

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
 * `cp{motion...}` evaluates the result of the motion, so `cpaf` is the current form your cursor is on.
 * `cpp` is a shorthand version of `cpaf`, can come in pretty handy.

There's no other bindings but I define these in my own [dotfiles][], you may want them too. I didn't want to put them in by default since some people, understandably, hate that.

```viml
" Starts the REPL.
autocmd FileType scheme nnoremap <buffer> <localleader>rc :SchemeConnect<cr>

" Evaluates the outer most / top level form and jumps the cursor back to where it was.
autocmd FileType scheme nnoremap <buffer> <localleader>re :normal mscpaF<cr>`s

" Evaluates the entire file.
autocmd FileType scheme nnoremap <buffer> <localleader>rf :normal msggcpG<cr>`s
```

I set my local leader to comma, so I would press `,re` to evaluate my current outermost form. Note my usage of the `s` mark to jump back to the original location, if you rely on marks a lot that could trip you up.

## Configuration

You may set `g:scheme_split_size` to change the size of the terminal that's created when you connect.

```viml
let g:scheme_split_size = -10
```

Thanks to [@markx][] you can set `g:scheme_executable` to change the name of the Scheme you wish to work with. If you'd like to work with Racket, for example, you can use this.

```viml
let g:scheme_executable = "racket"
```

The plugin mappings are currently set up for `scheme` or `racket` by default, you may have to pull request in more if you'd like to use them with another filetype.

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
[vim-plug]: https://github.com/junegunn/vim-plug
[dotfiles]: https://github.com/Olical/dotfiles
[@markx]: https://github.com/markx
