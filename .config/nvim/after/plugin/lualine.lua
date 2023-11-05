require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 0100,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { {'filename', path = 1}, {'diagnostics', update_in_insert = true} }, -- TODO: diganostics sources todo-commands
        lualine_c = { {'branch', color={fg='green'}}, 'diff'},
        lualine_x = { 'filetype', 'selectioncount'},
        lualine_y = { 'location', 'progress' },
        lualine_z = { 'fileformat' }
    },

    inactive_sections = {
        lualine_a = {{'filename', path = 1}},
        lualine_b = {},
        lualine_c = {'diagnostics', 'diff'},
        lualine_x = {},
        lualine_y = {'filetype'},
        lualine_z = {'fileformat', 'fileformat','fileformat','fileformat',}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'fugitive', 'man', 'mason', 'nvim-dap-ui', 'nvim-tree', 'quickfix', 'toggleterm' }
}
