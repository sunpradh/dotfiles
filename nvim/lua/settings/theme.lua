--
-- THEME
--

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')

local function change_bg(higroups, ctermbg, guibg)
    for _, group in ipairs(higroups) do
        vim.cmd("hi " .. group .. " ctermbg=" .. ctermbg .." guibg=" .. guibg)
    end
end

change_bg(
    {'Normal', 'LineNr', 'SignColumn', 'Spellbad', 'WinSeperator'},
    "NONE", "NONE"
)
change_bg(
    {'Cursorline', 'Folded'},
    '0', '#292929'
)
