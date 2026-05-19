--
-- THEME
--

vim.o.termguicolors = true
vim.o.background = 'dark'
-- Window bar title
vim.o.winbar = '%f %m %h'
-- Global statusline
vim.o.laststatus = 3

-- Terafox colorscheme
-- require('nightfox').setup({
--     options = {
--         transparent = true
--     }
-- })
-- vim.cmd('colorscheme terafox')

vim.cmd('colorscheme kanagawa-dragon')


-- Tweak colorscheme
local function change_bg(higroups, ctermbg, guibg)
   for _, group in ipairs(higroups) do
       vim.cmd("hi " .. group .. " ctermbg=" .. ctermbg .." guibg=" .. guibg)
   end
end

change_bg({'Normal', 'TelescopeBorder'}, 'none', 'none')

change_bg(
   {'Cursorline', 'Folded', 'CursorLineNr'},
   '0', '#333333'
)
