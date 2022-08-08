--
-- PLUGINS
--

require('packer').startup(function(use)
    -- Language server protocol (autocompletion and more)
    use 'neovim/nvim-lspconfig'

    -- Completion engine
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-omni'
    use 'hrsh7th/nvim-cmp'

    -- Tree-sitter (syntax highlighting engine)
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Telescope / fuzzy finder
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Note taking
    use 'vimwiki/vimwiki'

    -- LaTeX
    use 'lervag/vimtex'
    use 'lewis6991/spellsitter.nvim'
    use 'andymass/vim-matchup'
    use 'wellle/targets.vim'

    -- Statusline
    use 'nvim-lualine/lualine.nvim'

    -- Easy comments
    use 'numToStr/Comment.nvim'

    -- Easy surround
    use 'tpope/vim-surround'

    -- remember last saved place
    use 'farmergreg/vim-lastplace'

    -- Easy alignment
    use 'junegunn/vim-easy-align'

    -- UNIX sugar for Vim
    use 'tpope/vim-eunuch'

    -- cool icons
    use 'kyazdani42/nvim-web-devicons'

    -- Colorscheme
    use 'rktjmp/lush.nvim'
    use 'ellisonleao/gruvbox.nvim'

    -- Markdown preview
    use {"iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end}

    -- Smooth scrolling
    use 'karb94/neoscroll.nvim'

end)

-- load Comment.nvim
require('Comment').setup()

-- load neoscrool.nvim
require('neoscroll').setup()

