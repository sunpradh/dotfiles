local ts = require('telescope')

-- Telescope settings
ts.setup {
    defaults = {
        file_ignore_patterns = {
            "__pycache__",
            ".pdf$",
            ".h5$",
            ".ipynb$",
            -- annoying latex temp files
            ".aux$",
            ".bbl$",
            ".blg$",
            ".fls$",
            ".log$",
            ".fdb_latexmk$"
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}

ts.load_extension('fzf')

-- Mappings for Telescope
local pickers = require('telescope.builtin')
local nmap = require('settings.keymap').nnoremap

nmap('<A-f>',      function() pickers.find_files({ follow = true }) end)
nmap('<A-b>',      function() pickers.buffers() end)
nmap('<leader>g',  function() pickers.live_grep() end)
nmap('<leader>ht', function() pickers.help_tags() end)
nmap('<leader>dg', function() pickers.lsp_document_diagnostics() end)
nmap('<leader>ds', function() pickers.lsp_document_symbols() end)
nmap('<leader>fb', function() pickers.file_browser() end)
nmap('<leader>ch', function() pickers.command_history() end)
