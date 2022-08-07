--
-- AUTOCMDS
--

local function new_augroup(name)
    return vim.api.nvim_create_augroup(name, {clear = true})
end

-- Activate cursor line only for active window
local CURSORS = new_augroup("CURSORS")
local function set_cursorline(state)
    return function() vim.opt_local.cursorline = state end
end

vim.api.nvim_create_autocmd({"VimEnter", "WinEnter", "BufWinEnter"}, {
    group = CURSORS,
    callback = set_cursorline(true)
})
vim.api.nvim_create_autocmd("WinLeave", {
    group = CURSORS,
    callback = set_cursorline(false)
})


-- Automatically resize windows
local RESIZE = new_augroup("RESIZE")
vim.api.nvim_create_autocmd("VimResized", {
    group = RESIZE,
    callback = function() vim.cmd("wincmd =") end
})


-- Automatically trim whitespace at the end of lines
local TRIM = new_augroup("TRIM")
local function TrimWhitespace()
    vim.cmd([[
        let save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(save)
    ]])
end

vim.api.nvim_create_autocmd("BufWritePre", {
    group = TRIM,
    callback = TrimWhitespace
})

-- Set filetype for specific file
local FILES = new_augroup("FILES")
local function set_filetype(type)
    return function() vim.opt_local.filetype = type end
end

vim.api.nvim_create_autocmd("BufRead", {
    group = FILES,
    pattern = "~/.config/sway/*",
    callback = set_filetype("config")
})
vim.api.nvim_create_autocmd("BufRead", {
    group = FILES,
    pattern = "*.rasi",
    callback = set_filetype("css")
})
