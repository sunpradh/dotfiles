return {
    -- Easy comments
    { 'nvim-mini/mini.comment', version = false, config = true },

    -- Easy alignment
    { 'nvim-mini/mini.align', version = false, config = true },

    -- Auto-pairs
    { 'windwp/nvim-autopairs', config = true },

    -- Auto-surround
    { 'kylechui/nvim-surround', config = true },

    -- Remember last place
    { 'vladdoster/remember.nvim', config = function() require('remember') end },

    -- Indent blanklines
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- UNIX sugar for Vim
    { 'tpope/vim-eunuch' },

    -- Smooth scrolling
    { 'karb94/neoscroll.nvim', config = true },

    -- Highlights comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        ft = {"python", "lua"},
        config = function ()
            tc = require("todo-comments")
            tc.setup({})
            vim.keymap.set("n", "]t", function() tc.jump_next() end, { desc = "Next todo comment" })
            vim.keymap.set("n", "[t", function() tc.jump_prev() end, { desc = "Previous todo comment" })
        end
    }
}
