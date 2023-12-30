--
-- OPTIONS
--

-- Leader key
vim.g.mapleader = ' '

-- Aspect
vim.o.hidden = true  	        -- switch buffers even if are unsaved
vim.o.number = true  	        -- Show line numbers
vim.o.relativenumber = true  	-- Show relative line numbers
vim.o.title = true  	        -- set the title of the window
vim.o.scrolloff = 8  	        -- min num of lines above/below the cursorline
vim.o.inccommand = "nosplit"  	-- show :substitute preview
vim.o.signcolumn = "number"     -- compress the signcolumn

-- Searching
vim.o.hlsearch = false  	-- Do not highlight all search results
vim.o.smartcase = true  	-- Enable smart-case search

-- Spacing
vim.o.expandtab = true  	-- Expand tabs
vim.o.shiftwidth = 4  	        -- Number of auto-indent spaces
vim.o.softtabstop = 4  	        -- Number of spaces per Tab
vim.o.smartindent = true  	-- Enable smart-indent

-- Splitting
vim.o.splitbelow = true  	-- new split below
vim.o.splitright = true  	-- new vsplit right
vim.o.wrap = false  	        -- no wrapping lines

-- History settings
vim.o.swapfile = false
vim.o.backup = false

-- Clear jumplist
vim.cmd("clearjumps")
