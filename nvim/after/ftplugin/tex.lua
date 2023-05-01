-- Wrapping and spelling
vim.o.wrap = true
vim.o.linebreak = true
vim.o.spell = true
vim.o.spelllang = "en,it"

-- Autopairs
local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')

-- auto $ $
-- too buggy
-- npairs.add_rule(
--     Rule('$', '$', {'tex', 'latex'})
--         -- don't open pairs if there are non-space characters before
--         :with_pair(cond.not_before_regex('%S', 1))
--         -- just move the cursor the next character is $
--         :with_move(cond.after_text('$'))
-- )

-- auto \{ \}
npairs.add_rule(
    Rule('\\{', '\\}', {'tex', 'latex'})
        -- :with_move(cond.after_text('\\}'))
)

-- auto ` '
npairs.remove_rule('`')
npairs.add_rule(
    Rule('`', '\'', {'tex', 'latex'})
)

---- Mappings
local nmap = require('settings.keymap').nnoremap
local vmap = require('settings.keymap').vnoremap

-- Foldings
nmap('<leader>of', 'zR') -- open
nmap('<leader>cf', 'zM') -- close

-- emph or textbf selection
vmap('<leader>e', 'di\\emph{<C-R>"}<Esc>') -- emph
vmap('<leader>b', 'di\\textbf{<C-R>"}<Esc>') -- textbf

-- center env
vmap('<leader>ce', 'di\\begin{center}<CR><C-R>"<CR>\\end{center}<ESC>=ae%k')

-- split env
vmap('<leader>sp', 'di\\begin{split}<CR><C-R>"<CR>\\end{split}<ESC>=ae%k')

-- Automatic cleanup
vim.api.nvim_create_autocmd("VimLeave", {
    group = vim.api.nvim_create_augroup("TexCleanUp", {clear = true}),
    pattern = "*.tex",
    callback = function() vim.cmd('VimtexClean') end
})
