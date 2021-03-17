# vim-scheme

## Deprecation!

Hello, intrepid Lisper! You've stumbled into a project I started around 2018 which has since been completely superseded!

You should use [Conjure](https://github.com/Olical/conjure) instead, it's the descendent of this project and is _far_ more advanced. It (at the time of writing) has support for the following languages with more to come:

 * Clojure + ClojureScript
 * Fennel
 * Janet
 * Hy
 * MIT Scheme
 * Guile
 * Racket

It's built in Fennel, a Lisp compiled to Lua, using [Aniseed](https://github.com/Olical/aniseed) and it's actively maintained. I promise that Conjure's UX will make working with MIT Scheme so much more pleasant.

If that hasn't convinced you, please do continue to read, this plugin still works (I think), but I think you'll love Conjure.

Regardless, have a great day!

@Olical

## Introduction

> Warning: Currently depends on [vim-sexp][] for selecting forms.

This plugin allows you to evaluate [Scheme][] from within your buffer. It delegates evaluation to an [mit-scheme][] REPL started by a Vim/Neovim `:terminal` command.

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
 * `<localleader>rc` is bound to `SchemeConnect`.
 * `<localleader>rr` issues a restart, great for getting out of an error state.
 * `<localleader>re` evaluates the outer most / top level form and jumps the cursor back to where it was.
 * `<localleader>rf` evaluates the entire file and jumps the cursor back to where it was.

> Note: The `re` and `rf` mappings use the `s` mark for jumping back to where your cursor was at the time of the evaluation. As long as you're not using the `s` mark for anything you shouldn't notice. This can be remapped or even improved in a PR.

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
