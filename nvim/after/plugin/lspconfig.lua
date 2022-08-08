--
-- Language Server
--
local lsp = require('lspconfig')

local mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key,
        "<cmd>lua "..result.."<cr>",
        {noremap = true, silent = true})
end

local custom_attach = function()
    -- move cursor to the next and previous diagnostic
    mapper('n', ']g', 'vim.diagnostic.goto_next()')
    mapper('n', '[g', 'vim.diagnostic.goto_prev()')
    -- diagnostic location list
    mapper('n', '<leader>d', 'vim.diagnostic.setloclist()')
    -- jump between symbols
    mapper('n', 'gd', 'vim.lsp.buf.definition()')
    mapper('n', 'gi', 'vim.lsp.buf.implementation()')
    mapper('n', 'gr', 'vim.lsp.buf.references()')
    mapper('n', 'g0', 'vim.lsp.buf.document_symbol()')
    -- hover popup
    mapper('n', 'K', 'vim.lsp.buf.hover()')
    -- Rename
    mapper('n', 'gR', 'vim.lsp.buf.rename()')
    -- Float window for diagnostic
    mapper('n', '<C-k>', 'vim.diagnostic.open_float()')
end

-- For lua language server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Integrate nvim-cmp and lspconfig
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Python
lsp.pylsp.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { enabled = false }
            }
        }
    }
}

-- C/C++
lsp.clangd.setup{
    on_attach = custom_attach,
    capabilities = capabilities
}

-- Lua
lsp.sumneko_lua.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            -- Get the language server to recognize the `vim` global
            diagnostics = { globals = {'vim'}, },
            -- Make the server aware of Neovim runtime files
            workspace = { library = vim.api.nvim_get_runtime_file("", true), },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false, },
        },
    },
}
