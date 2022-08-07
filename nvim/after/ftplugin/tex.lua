-- Completion for nvim-cmp
require('cmp').setup.buffer({ source = {{ name = 'omni' }}})

-- Wrapping and spelling
vim.o.wrap = true
vim.o.linebreak = true
require('spellsitter').setup()
vim.o.spell = true
vim.o.spelllang = "en,it"

-- matchparens
-- TODO: da riparare, textobjects tra $ $ non viene riconosciuto
vim.g.matchup_override_vimtex = 1
vim.g.vimtex_text_obj_variant = 'targets'

---- Mappings
local nmap = require('settings.keymap').nnoremap
local vmap = require('settings.keymap').vnoremap

-- Foldings
nmap('<leader>of', 'zR') -- open
nmap('<leader>cf', 'zM') -- close

-- emph or textbf selection
vmap('<leader>e', 'di\\emph{<C-R>"}<Esc>') -- emph
vmap('<leader>b', 'di\textbf{<C-R>"}<Esc>') -- textbf

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
