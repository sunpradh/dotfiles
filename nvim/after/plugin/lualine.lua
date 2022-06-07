require'lualine'.setup({
    options = {
        icons_enabled = true,
        theme = 'gruvbox_dark',
        component_separators = { left = ' ', right = ' '},
        section_separators = { left = ' ', right = ' '},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {
                'filename',
                file_status = true,  -- displays file status (readonly status, modified status)
                path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
                shorting_target = 40 -- Shortens path to leave 40 space in the window
                -- for other components. Terrible name any suggestions?
            }
        },
        lualine_c = {
            {
                'diagnostics',
                sources = {'nvim_diagnostic'},
                sections = {'error', 'warn', 'info', 'hint'},
                symbols = {error = 'Err ', warn = 'Warn ', info = 'Info ', hint = 'Hint '},
                colored = false, -- displays diagnostics status in color if set to true
                update_in_insert = false, -- Update diagnostics in insert mode
                always_visible = false, -- Show diagnostics even if count is 0, boolean or function returning boolean
            }
        },
        lualine_x = {
            'encoding',
            'fileformat',
            {'filetype', icon_only = true }
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
})
