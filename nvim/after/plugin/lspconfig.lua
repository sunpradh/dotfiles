--
-- Language Server
--
local lsp = require('lspconfig')
local keymap = require('settings.keymap')

local nmap = keymap.nnoremap
-- move cursor to the next and previous diagnostics
nmap(']g', vim.diagnostic.goto_next)
nmap('[g', vim.diagnostic.goto_prev)
-- float window for diagnostics
nmap('<space>e', vim.diagnostic.open_float)
-- locations of all diagnostics
nmap('<space>q', vim.diagnostic.setloclist)

local custom_attach = function(client, bufnr)
    local mapper = keymap.bind('n', {noremap=true, silent=true, buffer=bufnr})
    -- jump between symbols
    mapper('gd', vim.lsp.buf.definition)
    mapper('gD', vim.lsp.buf.declaration)
    mapper('gi', vim.lsp.buf.implementation)
    mapper('gr', vim.lsp.buf.references)
    mapper('g0', vim.lsp.buf.document_symbol)
    -- hover popup
    mapper('K', vim.lsp.buf.hover)
    -- Rename
    mapper('gR', vim.lsp.buf.rename)
    -- Code actions
    mapper('gA', vim.lsp.buf.code_action)
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
lsp.ccls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    init_options = {
        compilationDatabaseDirectory = ".";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"} ;
        };
    }
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

-- LaTeX
lsp.texlab.setup{
    on_attach = custom_attach,
    capabilities = capabilities,
    settings = {
        texlab = {
            diagnostics = {
                ignoredPatterns = {"[Oo]verfull.*"}
            }
        }
    }
}

lsp.grammar_guard.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
    cmd = {'/usr/bin/ltex-ls'},
    settings = {
        ltex = {
            enabled = { "latex", "tex", "bib", "markdown" },
            language = "en",
            diagnosticSeverity = "information",
            setenceCacheSize = 2000,
            additionalRules = {
                enablePickyRules = true,
                motherTongue = "it",
            },
            dictionary = {},
            disabledRules = {},
            hiddenFalsePositives = {},
            checkFrequency = "edit",
        }
    }
})
