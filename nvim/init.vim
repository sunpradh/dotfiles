"========================================
" GENERAL SETTINGS
"========================================

lua require('settings.options')
lua require('settings.mappings')

"========================================
" PLUGINS (with vim-plug)
"========================================

call plug#begin(stdpath('data') . '/plugged')

" Language server protocol (autocompletion and more)
Plug 'neovim/nvim-lspconfig'

" Completion engine
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/nvim-cmp'

" Tree-sitter (syntax highlighting engine)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Telescope / fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Note taking
Plug 'vimwiki/vimwiki'

" LaTeX
Plug 'lervag/vimtex'
Plug 'lewis6991/spellsitter.nvim'
Plug 'andymass/vim-matchup'
Plug 'wellle/targets.vim'

" Statusline
Plug 'nvim-lualine/lualine.nvim'

" Easy comments
Plug 'numToStr/Comment.nvim'

" Easy surround
Plug 'tpope/vim-surround'

" remember last saved place
Plug 'farmergreg/vim-lastplace'

" Easy alignment
Plug 'junegunn/vim-easy-align'

" UNIX sugar for Vim
Plug 'tpope/vim-eunuch'

" cool icons
Plug 'kyazdani42/nvim-web-devicons'

" Colorscheme
" Plug 'chriskempson/base16-vim'
" Plug 'morhetz/gruvbox'
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Smooth scrolling
Plug 'karb94/neoscroll.nvim'

call plug#end()

"========================================
" MISC SETTINGS
"========================================

lua require("settings.theme")
lua require("settings.autocmds")

" load Comment.nvim
lua require('Comment').setup()

" load neoscrool.nvim
lua require('neoscroll').setup()

" diagnostic menu
command! Diagnostic lua vim.lsp.diagnostic.set_loclist()

" the rest of the settings are autoloaded from after/plugin/*.(vim|lua)
