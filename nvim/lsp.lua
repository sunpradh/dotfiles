local lsp = require('lspconfig')
local completion = require('completion')
--require'lspconfig'.pyls.setup{}

local mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key,
        "<cmd>lua "..result.."<cr>",
        {noremap = true, silent = true})
end

local custom_attach = function()
    completion.on_attach()
    -- Move cursor to the next and previous diagnostic
    mapper('n', ']g', 'vim.lsp.diagnostic.goto_next()')
    mapper('n', '[g', 'vim.lsp.diagnostic.goto_prev()')
    -- jump between symbols
    mapper('n', 'gd', 'vim.lsp.buf.definition()')
    mapper('n', 'gi', 'vim.lsp.buf.implementation()')
    mapper('n', 'gr', 'vim.lsp.buf.references()')
    mapper('n', 'g0', 'vim.lsp.buf.document_symbol()')
    -- hover popup
    mapper('n', 'K',  'vim.lsp.buf.hover()')
    mapper('n', 'gR', 'vim.lsp.buf.rename()')
end

lsp.pylsp.setup{on_attach = custom_attach}   -- Python
lsp.clangd.setup{on_attach = custom_attach} -- C/C++
lsp.texlab.setup{on_attach = custom_attach} -- LaTeX
