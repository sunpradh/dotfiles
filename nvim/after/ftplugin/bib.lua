-- Disable spelling
vim.opt.spell = false

local nmap = require('settings.keymap').nnoremap

nmap('<leader>b', 'o<ESC>:.!doi2bib "<C-R>+"')
nmap('<leader>ab', 'o<ESC>:.!doi2bib -a "<C-R>+"')
-- nmap('<leader>db', 'o<ESC>:.!doi2bib ')
