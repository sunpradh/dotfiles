--
-- MAPPINGS
--

local nmap = require('settings.keymap').nnoremap
local tmap = require('settings.keymap').tnoremap
local vmap = require('settings.keymap').vnoremap
local imap = require('settings.keymap').inoremap
local nxmap = require('settings.keymap').bind({"n", "x"})

-- Move between windows easily
nmap('<A-h>', '<C-w>h')
nmap('<A-j>', '<C-w>j')
nmap('<A-k>', '<C-w>k')
nmap('<A-l>', '<C-w>l')

-- Create new windows and tabs
nmap('<A-x>',   '<cmd>new<CR>')
nmap('<A-v>',   '<cmd>vnew<CR>')
nmap('<A-t>',   '<cmd>tabe<CR>')
nmap('<A-Tab>', '<cmd>tabn<CR>')

-- Remap <C-^> (alternate files)
nmap('<Backspace>', '<C-^>')

-- Move through the location list
nmap('<Tab>',   ':cnext<CR>')
nmap('<S-Tab>', ':cprev<CR>')

-- Disable annoying keymaps
nmap('q:', '<Nop>')
nmap('q?', '<Nop>')
nmap('Q',  '<Nop>')

-- Exit terminal mode
tmap('<A-q>', '<C-\\><C-n>')

-- Quick save
nmap('<C-s>', ':w<CR>')

-- Correct speeling mistakes on the fly
imap('<C-o>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- Copy/paste from clipboard
nmap('<C-p>', '"+P')
imap('<C-v>', '<C-r>+')
vmap('<C-y>', '\"+y')

-- Better indenting
vmap('<', '<gv')
vmap('>', '>gv')

-- Replace the word under cursor globally in the buffer
nmap('<leader>rw', '<cmd>%s/\\<<C-r><C-w>\\>//g<Left><Left>')

-- EasyAlign
nxmap('ga', '<Plug>(EasyAlign)')

-- Fix jump forward
nmap('<C-i>', '<C-S-i>')


---- Thanks ThePrimeagen for these keymaps

-- keeping it centered
nmap('n', 'nzz')
nmap('N', 'Nzz')
nmap('J', 'mzJ`z')

-- better undo
-- <C-g>u in insert mode breaks the undo sequence
imap(',', ',<C-g>u')
imap('.', '.<C-g>u')
imap('(', '(<C-g>u')
imap('[', '[<C-g>u')
imap('{', '{<C-g>u')
imap('!', '!<C-g>u')
imap('?', '?<C-g>u')

-- jumplist mutation
-- relative jumps with j and k now are part of the jumplist
nmap('j', 'v:count ? (v:count > 5 ? "m\'" . v:count : "") . "j" : "gj"', {expr = true})
nmap('k', 'v:count ? (v:count > 5 ? "m\'" . v:count : "") . "k" : "gk"', {expr = true})

-- moving text
vmap('J', '<cmd>m \'>+1<CR>gv=gv')
vmap('K', '<cmd>m \'<-2<CR>gv=gv')
