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
        lualine_z = {'fileformat', 'fileformat', 'fileformat','fileformat','fileformat',}
    },

    -- tabline = {
    --     lualine_a = {
    --         { 'tabs',
    --             separator = '',--{'', ''},
    --             mode = 2,
    --             tabs_color = {
    --                 active = { bg='#43bf9f', fg = '#025487', gui='bold' },
    --                 inactive = { bg='#1f2335', fg = '#2284a7', gui='italic,bold' }
    --             }
    --         }
    --     },
    -- },

    winbar = {},
    inactive_winbar = {},
    extensions = { 'fugitive', 'man', 'mason', 'nvim-dap-ui', 'nvim-tree', 'quickfix', 'toggleterm' }
}

-- TABBY
local theme = {
  fill = 'TabLineFill', --{ fg='#44b0d0', bg='#44b0d0'},
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLine',
  current_tab = { bg='#43bf9f', fg = '#003060', style='bold' },
  tab = { bg='#1f4355', fg = '#2284a7', style='bold' },
  win = 'TabLine',
  tail = 'TabLine',
}
require('tabby.tabline').set(function(line)
  return {
    -- {
    --   { '  ', hl = theme.head },
    --   line.sep('', theme.head, theme.fill),
    -- },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        -- tab.is_current() and '' or '󰆣',
        tab.number() .. '\\'..
        tab.name(),
        -- tab.close_btn(''),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    -- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
    --   return {
    --     line.sep('', theme.win, theme.fill),
    --     win.is_current() and '' or '',
    --     win.buf_name(),
    --     line.sep('', theme.win, theme.fill),
    --     hl = theme.win,
    --     margin = ' ',
    --   }
    -- end),
    -- {
    --   line.sep('', theme.tail, theme.fill),
    --   { '  ', hl = theme.tail },
    -- },
    -- hl = theme.fill,
  }
end)
