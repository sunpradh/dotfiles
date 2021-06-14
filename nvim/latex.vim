augroup latexgroup
    autocmd!
    " force filetype (necessary with empy files)
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    " completion
    autocmd BufRead *.tex,*.md lua require'completion'.on_attach()
    " set spelling and wrapping
    autocmd BufRead *.tex,*.md set spell
    autocmd BufRead *.tex,*.md set spelllang=en,it
    autocmd BufRead *.bib set nospell
    autocmd BufRead *.tex,*.md set wrap
    " some remapping
    autocmd BufRead *.tex,*.md noremap <silent> j gj
    autocmd BufRead *.tex,*.md noremap <silent> k gk
    " cleanup after leaving 
    autocmd VimLeave *.tex VimtexClean " auto clean-up
augroup end

let g:tex_flavor = 'latex'
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
" vimtex and zathura
let g:vimtex_view_method = 'zathura'
" Disable overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_ignore_filters = ['overfull', 'underfull', 'packages']
let g:vimtex_imaps_enabled = 0
let g:tex_comment_nospell = 1
" vimtex completion
lua require'completion'.addCompletionSource('vimtex', require'vimtex'.complete_item)
let g:completion_chain_complete_list = {
            \ 'tex' : [
            \     {'complete_items': ['vimtex']}, 
            \   ],
            \ }



