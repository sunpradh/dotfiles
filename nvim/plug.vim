"""
""" VIM-PLUG
"""

call plug#begin(stdpath('data') . '/plugged')

" Language server protocol (autocompletion)
Plug 'neovim/nvim-lspconfig'
" Completion engine
Plug 'nvim-lua/completion-nvim'
" Tree-sitter (syntax highlighting engine)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope.nvim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Fuzzy finder (telescope.nvim is somewhat slow compared to fzf.vim)
"Plug 'junegunn/fzf.vim'
" Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
" Note taking
Plug 'vimwiki/vimwiki'
" LaTeX
Plug 'lervag/vimtex'
" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Easy comments
Plug 'tpope/vim-commentary'
" Easy surround
Plug 'tpope/vim-surround'
" remember last saved place
Plug 'farmergreg/vim-lastplace'
" easy alignment
Plug 'junegunn/vim-easy-align'
" cool icons
Plug 'kyazdani42/nvim-web-devicons'
" Colorscheme
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

"""
""" PLUGIN SETTINGS
"""

""" TREESITTER
lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "maintained",
    disable          = {"latex"},
    highlight        = {enable = true},
    indent           = {enable = true}
}
EOF

""" ULTISNIPS
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-C-tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:ultisnips_python_style="numpy"

""" LaTeX (vimtex) and markdown
source $HOME/.config/nvim/latex.vim


""" Vimwiki
let g:vimwiki_table_mappings = 0
let g:vimwiki_list = [ {
	    \ 'path': '~/Università/Note/',
	    \ 'path_html': '~/Università/Note/html',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md'
	    \ } ]
let g:vimwiki_url_maxsave = 0

""" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

""" Airline
let g:airline_detect_whitespace = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='minimalist'

""" MARKDOWN-PREVIEW
let g:mkdp_refresh_slow = 1
let g:mkdp_auto_close = 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 1,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }




