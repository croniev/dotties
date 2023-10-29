---@diagnostic disable: undefined-global
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- cd into active dir and move up one dir
vim.keymap.set("n", "<leader>cd", ":cd %:h<cr>i<esc>")
vim.keymap.set("n", "<A-up>", ":cd ..<cr>i<esc>")
vim.keymap.set("n", "<A-down>", ":CdParentUnderPwd<CR>i<Esc>")

vim.keymap.set("n", "<C-a>", "m1GVgg") -- select all
-- Be able to move selected block up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Stay in selection after indent/undent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- centering sachen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Window movement
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-v>", "<C-w>v<C-w>l")
vim.keymap.set("n", "<A-x>", "<C-w>s<C-w>j")
vim.keymap.set("n", "<C-q>", "<C-w>q")

-- Tabs
vim.keymap.set("n", "<C-t>", ":tabnew <CR>")
vim.keymap.set("n", "<A-1>", ":tabnext 1 <CR>")
vim.keymap.set("n", "<A-2>", ":tabnext 2 <CR>")
vim.keymap.set("n", "<A-3>", ":tabnext 3 <CR>")
vim.keymap.set("n", "<A-4>", ":tabnext 4 <CR>")
vim.keymap.set("n", "<A-5>", ":tabnext 5 <CR>")

-- greatest remap ever
-- ????
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- ???
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- deleted stuff does not go into buffer
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- macht iwie nichts

-- unsure what cnext, cprev, lnext and lprev do
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- rename what is under the cursor
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make the file execcutable

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/main/packer.lua<CR>"); -- open packer file
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>"); -- find out ;)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
