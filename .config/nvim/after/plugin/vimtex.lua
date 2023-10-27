local g = vim.g

g.vimtex_view_general_viewer = 'okular'
g.vimtex_quickfix_ignore_filters = {'Underfull', 'Overfull', 'Package tudapub Warning', 'Package microtype Warning', 'Package scrlayer-scrpage Warning'}
-- set keybinding for compiler
vim.keymap.set("n", "<leader>ll", ":VimtexCompile<CR>")
