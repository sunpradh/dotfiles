--
-- PLUGINS
--

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

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
    use 'barreiroleo/ltex_extra.nvim'

    -- Statusline and bufferline
    use 'nvim-lualine/lualine.nvim'
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

    -- Easy comments
    use 'numToStr/Comment.nvim'

    -- Easy surround
    use "kylechui/nvim-surround"

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
    use "EdenEast/nightfox.nvim"

    -- Smooth scrolling
    use 'karb94/neoscroll.nvim'

    -- Indent blanklines
    use "lukas-reineke/indent-blankline.nvim"

    -- Autopairs
    use "windwp/nvim-autopairs"

    -- Fast motions
    use "ggandor/leap.nvim"

    -- Limelight
    use "junegunn/limelight.vim"
end)

-- load plugins that do not require configuration
require('Comment').setup()
require('neoscroll').setup()
require('bufferline').setup()
require('indent_blankline').setup()
require('nvim-surround').setup()
require('nvim-autopairs').setup()
require('leap').set_default_keymaps()
