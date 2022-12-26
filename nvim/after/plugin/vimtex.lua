--
-- LaTeX and Vimtex
--

-- TeX flavor
vim.g.tex_flavor = 'latex'

-- No spell check in comments
vim.g.tex_comment_nospell = 1

-- Vimtex and NeoVim
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_compiler_latexmk = {
    build_dir = '',
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    hooks = {},
    options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-shell-escape',
    }
}

-- view with zathura
-- vim.g.vimtex_view_method = 'zathura'
-- view with sioyek
vim.g.vimtex_view_method = 'sioyek'

-- disable vimtex foldings
vim.g.vimtex_fold_enabled = 0

-- Disable overfull/underfull \hbox and all package warnings
vim.g.vimtex_quickfix_ignore_filters = {'[Oo]verfull', '[Uu]nderfull', 'packages', 'float', 'Font Warning'}

-- insert maps (using luasnip instead)
vim.g.vimtex_imaps_enabled = 0

-- indent and syntax highlighting (using treesitter instead)
vim.g.vimtex_indent_enabled = 1
vim.g.vimtex_syntax_enabled = 1

-- enable completion
vim.g.vimtex_complete_enabled = 0
