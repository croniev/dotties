require('refactoring').setup({})
local map = vim.keymap.set
local opts = {noremap = true, silent = true}

map("x", "<leader>rf", function() require('refactoring').refactor('Extract Function') end, opts)
map("x", "<leader>re", function() require('refactoring').refactor('Extract Function To File') end, opts)
-- Extract function supports only visual mode
map("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end, opts)
-- Extract variable supports only visual mode
map("n", "<leader>rF", function() require('refactoring').refactor('Inline Function') end, opts)
-- Inline func supports only normal
map({ "n", "x" }, "<leader>rV", function() require('refactoring').refactor('Inline Variable') end, opts)
-- Inline var supports both normal and visual mode

map("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end, opts)
map("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end, opts)
-- Extract block supports only normal mode
