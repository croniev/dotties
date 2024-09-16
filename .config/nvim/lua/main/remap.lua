local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- local opts_loud = { noremap = true, silent = false }

vim.g.mapleader = " "

-- cd into active dir and move dir
map("n", "<leader>cd", ":cd %:h<cr>i<esc>", opts)
map("n", "<A-up>", ":cd ..<cr>i<esc>", opts)
map("n", "<A-down>", ":CdParentUnderPwd<CR>i<Esc>", opts)

-- Be able to move selected block up and down
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
-- Stay in selection after indent/undent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- centering sachen
map("n", "J", "mzJ`z", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- folds
map("n", "L", "zf%", opts)

-- copying and pasting
map("x", "<leader>p", [["_dP]], opts) -- overpaste without copying what is deleted
map({ "n", "v" }, "<leader>y", [["+y]], opts) -- yank into external clipboard
map("n", "<leader>Y", [["+Y]], opts) -- yank into external clipboard
map({ "n", "v" }, "<leader>d", [["_d]], opts) -- deleted stuff does not go into buffer

-- Quick edits
map("n", "<C-a>", "<CMD>Boole increment<CR>", opts)
map("n", "<C-x>", "<CMD>Boole decrement<CR>", opts)
-- map("i", "<C-k>", "<cmd>lua require 'main.keymapfunctions'.luasnipchoose(-1)<cr>", opts)
-- map("i", "<C-j>", "<cmd>lua require 'main.keymapfunctions'.luasnipchoose(1)<cr>", opts)

-- Flash
map("o", "s", function() require'flash'.jump() end, opts)
map("o", "S", function() require'flash'.treesitter() end, opts)
map("o", "r", function() require'flash'.remote() end, opts)
map("o", "R", function() require'flash'.treesitter_search() end, opts)
-- map("o", "", function() require'flash'.toggle() end, opts)

-- Window movement
map("n", "<A-l>", "<C-w>l", opts)
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-v>", "<C-w>v<C-w>l", opts)
map("n", "<A-x>", "<C-w>s<C-w>j", opts)
map("n", "<C-q>", ":bd<CR>", opts)
-- window sizes
map('n', '<A-,>', '<C-w><')
map('n', '<A-.>', '<C-w>>')
map('n', '<A-m>', '<C-w>-')
map('n', '<A-/>', '<C-w>+')
-- Zen mode
map('n', '<A-z>', ':ZenMode<CR>')

-- Tabs
map("n", "<C-t>", ":tabnew <CR>", opts)
map("n", "<A-1>", ":tabnext 1 <CR>", opts)
map("n", "<A-2>", ":tabnext 2 <CR>", opts)
map("n", "<A-3>", ":tabnext 3 <CR>", opts)
map("n", "<A-4>", ":tabnext 4 <CR>", opts)

-- Terminal and file execution
-- TODO: anpassen an toggleterm/floatterm
map("n", "<A-t>", ":tabnew<CR>:term<CR>i", opts)
map("n", "<C-C>", "i<C-c>", opts)                                               -- terminate fg terminal job
map('t', "<ESC>", '<C-\\><C-n>', opts)                                          -- Exit terminal with ESC

-- Primagen stuff
map("i", "<C-c>", "<Esc>", opts)
map("n", "Q", "<nop>", opts)
map("n", "<leader>pac", "<cmd>e ~/.config/nvim/lua/main/packer.lua<CR>", opts); -- open packer file
map("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", opts);        -- find out ;, opts)

-- quickfix and location list nav
map("n", "<C-j>", "<cmd>cnext<CR>zz", opts)
map("n", "<C-k>", "<cmd>cprev<CR>zz", opts)
map("n", "<leader>k", "<cmd>lnext<CR>zz", opts) -- only list in current filej
map("n", "<leader>j", "<cmd>lprev<CR>zz", opts)
