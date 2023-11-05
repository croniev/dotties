local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local opts_loud = { noremap = true, silent = false }

vim.g.mapleader = " "
map("n", "<leader>pv", vim.cmd.Ex, opts)

map("n", "<leader><leader>", function() vim.cmd("so") end) -- Source

-- help
map("n", "<leader>h", 'yiw:h <C-r>"<CR>')
map("n", "<leader>H", 'yiw:helpgrep <C-r>"<CR>')
map("v", "<leader>h", 'y<ESC>:h <C-r>"<CR>')
map("v", "<leader>H", 'y<ESC>:helpgrep <C-r>"<CR>')

-- cd into active dir and move up one dir
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

-- copying and pasting
map("x", "<leader>p", [["_dP]], opts) -- overpaste without copying what is deleted
-- yank into external clipboard
map({ "n", "v" }, "<leader>y", [["+y]], opts)
map("n", "<leader>Y", [["+Y]], opts)
map({ "n", "v" }, "<leader>d", [["_d]], opts) -- deleted stuff does not go into buffer

-- Quick edits
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts_loud) -- rename what is under the cursor
map("n", "<C-a>", ":Boole increment<CR>", opts)
map("n", "<C-x>", ":Boole decrement<CR>", opts)
-- map("i", "<C-k>", "<cmd>lua require 'main.keymapfunctions'.luasnipchoose(-1)<cr>", opts)
-- map("i", "<C-j>", "<cmd>lua require 'main.keymapfunctions'.luasnipchoose(1)<cr>", opts)

-- Window movement
map("n", "<A-l>", "<C-w>l", opts)
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-v>", "<C-w>v<C-w>l", opts)
map("n", "<A-x>", "<C-w>s<C-w>j", opts)
map("n", "<C-q>", "<C-w>q", opts)
-- window sizes
map('n', '<A-,>', '<C-w><')
map('n', '<A-.>', '<C-w>>')
map('n', '<A-m>', '<C-w>-')
map('n', '<A-/>', '<C-w>+')

map('n', '<A-z>', ':ZenMode<CR>')

-- Tabs
map("n", "<C-t>", ":tabnew <CR>", opts)
map("n", "<A-1>", ":tabnext 1 <CR>", opts)
map("n", "<A-2>", ":tabnext 2 <CR>", opts)
map("n", "<A-3>", ":tabnext 3 <CR>", opts)
map("n", "<A-4>", ":tabnext 4 <CR>", opts)

-- Terminal and file execution
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })                -- make the file execcutable
-- TODO: anpassen an toggleterm/floatterm
map("n", "<leader>r", ":RunInTerminal<CR>", opts)                               -- Launch code
map("n", "<A-t>", ":tabnew<CR>:term<CR>i", opts)
map("n", "<C-C>", "i<C-c>", opts)                                               -- terminate fg terminal job
map('t', "<ESC>", '<C-\\><C-n>', opts)                                          -- Exit terminal with ESC

-- Primagen stuff
map("i", "<C-c>", "<Esc>", opts)
map("n", "Q", "<nop>", opts)
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
map("n", "<leader>pac", "<cmd>e ~/.config/nvim/lua/main/packer.lua<CR>", opts); -- open packer file
map("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", opts);        -- find out ;, opts)

-- quickfix list
map("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
map("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
map("n", "<leader>k", "<cmd>lnext<CR>zz", opts) -- only list in current filej
map("n", "<leader>j", "<cmd>lprev<CR>zz", opts)
map("n", "<leader>cl", "<cmd>cw<CR>", opts) -- show list
map("n", "<leader>cc", "<cmd>ccl<CR>", opts) -- close list
map("n", "<leader>cx", "<cmd>cexpr []<CR>:ccl<CR>", opts) -- empty list
