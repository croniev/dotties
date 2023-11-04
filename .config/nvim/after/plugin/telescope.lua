local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require'telescope'.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = {actions.move_selection_next, type = "action", opts = { nowait = true, silent = true }},
                ["<C-k>"] = {actions.move_selection_previous, type = "action", opts = { nowait = true, silent = true }},
                ["<C-n>"] = {actions.cycle_history_next, type = "action", opts = { nowait = true, silent = true }},
                ["<C-p>"] = {actions.cycle_history_prev, type = "action", opts = { nowait = true, silent = true }},
            }
        },
        file_ignore_patterns = { ".aux", "%.pyc" },
    }
}

vim.keymap.set('n', '<C-o>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
