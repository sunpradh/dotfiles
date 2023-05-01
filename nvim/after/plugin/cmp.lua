--
-- Completion Engine
--
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        -- snippets with luasnip
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if luasnip.expandable() then luasnip.expand() else fallback() end
            end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(
            function(fallback)
                if luasnip.locally_jumpable() then luasnip.jump(1) else fallback() end
            end, { "i", "s" }),
        ["<S-C-Tab>"] = cmp.mapping(
            function(fallback)
                if luasnip.locally_jumpable(-1) then luasnip.jump(-1) else fallback() end
            end, { "i", "s" }),

        -- LSP mappings
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- language server
        { name = 'luasnip' }, -- luasnip snippets
    }, {
            { name = 'buffer' },
        })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})
