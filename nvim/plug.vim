"""
""" VIM-PLUG
"""

call plug#begin(stdpath('data') . '/plugged')
" Language server protocol
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
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
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
" Colorscheme
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

call plug#end()

"""
""" PLUGIN SETTINGS
"""

""" TREESITTER
lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "maintained",
    highlight        = {enable = true},
    indent           = {enable = true}
}
EOF

""" Ultisnips
" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-C-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"
" numpy style docstrings for python
let g:ultisnips_python_style="numpy"

""" LaTeX (vimtex) and markdown
source $HOME/.config/nvim/latex.vim

""" vimwiki
let g:vimwiki_table_mappings = 0
let g:vimwiki_list = [ {
	    \ 'path': '~/Università/Note/',
	    \ 'path_html': '~/Università/Note/html',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md'
	    \ } ]

""" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

""" Airline
let g:airline_detect_whitespace = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#coc#enabled = 0
let g:airline_theme='minimalist'
