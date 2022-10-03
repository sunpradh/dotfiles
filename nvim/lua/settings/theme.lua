--
-- THEME
--

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.winbar = '%f'

-- Carbonfox (from nightfox)
require('nightfox').setup({
    options = {
        styles = {
            comments = "italic",
            conditionals = "bold",
            keywords = "bold",
            strings = "italic",
            types = "bold"
        }
    }
})
vim.cmd('colorscheme carbonfox')

local function change_bg(higroups, ctermbg, guibg)
    for _, group in ipairs(higroups) do
        vim.cmd("hi " .. group .. " ctermbg=" .. ctermbg .." guibg=" .. guibg)
    end
end

change_bg(
    {'Cursorline', 'Folded', 'CursorLineNr'},
    '0', '#282828'
)
vim.cmd("hi VertSplit guifg=#484848")
