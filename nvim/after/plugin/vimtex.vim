" TeX flavor
let g:tex_flavor = 'latex'

" no spell check in comments
let g:tex_comment_nospell = 1

" vimtex and neovim
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \ ],
    \}

" view with zathura
let g:vimtex_view_method = 'zathura'

" disable vimtex foldings
let g:vimtex_fold_enabled = 0

""" Disable some features
" overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_ignore_filters = ['[Oo]verfull', '[Uu]nderfull', 'packages']

" insert maps (using Ultisnips instead)
let g:vimtex_imaps_enabled = 0

" indent and syntax highlighting (using treesitter instead)
" let g:vimtex_indent_enabled = 0
let g:vimtex_syntax_enabled = 1
