""" ============================================================
"""  VIM-PLUG
""" ============================================================

call plug#begin(stdpath('data') . '/plugged')

" Language server protocol
"Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim' " Fuzzy finding
Plug 'junegunn/fzf.vim'
" Snippets
Plug 'sirver/ultisnips'           " snippets plugin
Plug 'honza/vim-snippets'         " set of snippets
" Note taking
Plug 'vimwiki/vimwiki'
" LaTeX
Plug 'lervag/vimtex'
"Plug 'KeitaNakamura/tex-conceal.vim', {'for': ['tex', 'markdown', 'vimwiki']} " LaTeX conceal
" Syntax highlighting
Plug 'sheerun/vim-polyglot'
" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" easy surround
Plug 'tpope/vim-surround'         " surround
" remember last saved place
Plug 'farmergreg/vim-lastplace'
" easy alignment
Plug 'junegunn/vim-easy-align'
" cool icons
Plug 'ryanoasis/vim-devicons'
" Syntax for other languages
Plug 'kevinoid/vim-jsonc'
"Plug 'jvirtanen/vim-octave'
" Distraction-free writing
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
" Colorscheme
Plug 'chriskempson/base16-vim'	  " base16 color schemes
Plug 'tpope/vim-commentary'	  " easy comments
" Vim in firefox
"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }


call plug#end()

""" ============================================================
"""  PLUGIN SETTINGS
""" ============================================================

""" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-C-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"
" numpy style docstrings for python
let g:ultisnips_python_style="numpy"

""" LaTeX (vimtex) and markdown
augroup latexgroup
    " force filetype (necessary with empy files)
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    " set spelling and wrapping
    autocmd BufRead *.tex,*.md set spell
    autocmd BufRead *.tex,*.md set spelllang=en,it
    autocmd BufRead *.tex,*.md set wrap
    "autocmd BufRead *.tex,*.md set conceallevel=2
    autocmd BufRead *.tex,*.md hi Conceal guibg=NONE ctermbg=NONE
    autocmd BufRead *.tex,*.md lua require'completion'.on_attach()
    autocmd BufRead *.bib set nospell
    autocmd VimLeave *.tex VimtexClean " auto clean-up
augroup end

let g:tex_flavor = 'latex'
" vimtex and neovim
let g:vimtex_compiler_progname = 'nvr'
" vimtex and zathura
let g:vimtex_view_method = 'zathura'
" Disable overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_ignore_filters = ['overfull', 'underfull', 'packages']
let g:vimtex_imaps_enabled = 0
let g:tex_comment_nospell = 1
" vimtex
lua require'completion'.addCompletionSource('vimtex', require'vimtex'.complete_item)
let g:completion_chain_complete_list = {
            \ 'tex' : [
            \     {'complete_items': ['vimtex']}, 
            \   ],
            \ }

""" vimwiki
let g:vimwiki_table_mappings = 0
let g:vimwiki_list = [ {
	    \ 'path': '~/Università/Note/',
	    \ 'path_html': '~/Università/Note/html',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md'
	    \ } ]

""" Easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""" FZF
" Window option
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse' 

""" Markdown specific settings
augroup mdgroup
    "autocmd BufRead *.md nmap <leader>mp :MarkdownPreview<CR>
    "autocmd BufRead *.md nmap <leader>ms :MarkdownPreviewStop<CR>
    autocmd BufRead *.md CocDisable
    autocmd BufRead *.md nmap <leader>gg :Goyo 80%<CR>:Limelight<CR>
    autocmd BufRead *.md nmap <leader>gG :Goyo!<CR>:Limelight!<CR>
augroup end

""" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

""" Airline
let g:airline_detect_whitespace = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#coc#enabled = 0
let g:airline_theme='base16_default'

""" Vim-polyglot
" disable highlighting of whispace in python
let g:python_highlight_space_errors = 0
