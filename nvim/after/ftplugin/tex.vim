"""
""" LaTeX settings
"""

" completion for nvim-cmp
lua require('cmp').setup.buffer { sources = { { name = 'omni' } } }

" set wrapping
set wrap
set linebreak

" set spelling (use spellsitter)
lua require('spellsitter').setup()
set spell
set spelllang=en,it

" set folding
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

" matchparens
" TODO: da riparare, textobjects tra $ $ non viene riconosciuto
let g:matchup_override_vimtex = 1
let g:vimtex_text_obj_variant = 'targets'


""" Mappings
" open and close all folds (easier to remember)
noremap <leader>of zR
noremap <leader>cf zM

" emph or textbf selection
vnoremap <silent> <leader>e di\emph{<C-R>"}<Esc>
vnoremap <silent> <leader>b di\textbf{<C-R>"}<Esc>

" surround with center environment
vmap <leader>ce di\begin{center}<CR><C-R>"<CR>\end{center}<ESC>=ae%k

" surround with split environment
vmap <leader>sp di\begin{split}<CR><C-R>"<CR>\end{split}<ESC>=ae%k

" Autocleanup
augroup TexCleanup
    autocmd!
    autocmd VimLeave *.tex VimtexClean
augroup end
