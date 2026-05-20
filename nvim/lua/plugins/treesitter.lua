return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = 'false',
        branch = 'main',
        build = ':TSUpdate',
        init = function()
            local group = vim.api.nvim_create_augroup("MyTreeSitter", { clear = true })

            -- Autostart treesitter
            vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
                group = group,
                callback = function()
                    if vim.bo.buftype ~= "" then
                        return
                    end

                    pcall(vim.treesitter.start, 0)
                end,
            })

            -- Only needed parsers
            local parsers = {
                "bash",
                "bibtex",
                "c",
                "cpp",
                "diff",
                "html",
                "jsdoc",
                "json",
                "julia",
                "latex",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "toml",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
                "zsh",
            }

            -- Install only the needed parsers
            vim.api.nvim_create_autocmd("User", {
                group = group,
                pattern = "VeryLazy",
                once = true,
                callback = function()
                    require("nvim-treesitter").install(parsers)
                end,
            })

        end,
        opts = {
            -- LazyVim config for treesitter
            indent    = { enable = true },
            highlight = { enable = true },
            folds     = { enable = true },
        }
    },

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        lazy = false,
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },

                }
            })
        end,
    }
}
