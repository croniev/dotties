local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    print("blaifbaisluf")
    return
end
vim.g.mapleader = " "
vim.g.maplocalleader = " "

which_key.setup {
    triggers = {
        { "<leader>", mode = { "n", "v" } },
        { "[", mode = {"n", "v"}},
        { "]", mode = {"n", "v"}},
    },
    defer = function(ctx)
        if vim.list_contains({ "d", "y" }, ctx.operator) then
            return true
        end
        return vim.list_contains({ "<C-V>", "V" }, ctx.mode)
    end,

    win = {
        padding = { 1, 1 },
        border = "rounded",
        wo = {
            winblend = 10,
        }
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3,                    -- spacing between columns
        align = "center",               -- align columns left, center or right
    },
}

local nmappings = {
    { "<leader> ",  "<CMD>so<CR>",                                                                                                    desc = "Source",                nowait = true, remap = false },
    { "<leader>-",  ":lua require 'dap'.toggle_breakpoint()<CR>",                                                                     desc = "Toggle Breakpoint",     nowait = true, remap = false },
    { "<leader>/",  "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",                                                  desc = "Comment",               nowait = true, remap = false },
    { "<leader>a",  "<cmd>lua require'harpoon.mark'.add_file()<cr>",                                                                  desc = "Add to Harpoon",        nowait = true, remap = false },
    { "<leader>e",  "<cmd>NvimTreeToggle<cr>",                                                                                        desc = "Explorer",              nowait = true, remap = false },
    { "<leader>w",  "<cmd>w!<CR>",                                                                                                    desc = "Save",                  nowait = true, remap = false },
    { "<leader>F",  "<cmd>Telescope live_grep theme=ivy<cr>",                                                                         desc = "Live Grep",             nowait = true, remap = false },
    { "<leader>H",  'yiw:helpg <C-r>"<CR>',                                                                                           desc = "Get Helpgrep",          nowait = true, remap = false },
    { "<leader>P",  "<cmd>Telescope workspaces<cr>",                                                                                  desc = "Projects/Workspaces",   nowait = true, remap = false },
    { "<leader>W",  "<CMD>ToggleWrap<CR>",                                                                                            desc = "ToggleWrap",            nowait = true, remap = false },
    { "<leader>Y",  '"+Y',                                                                                                            desc = "Yank Line Ext",         nowait = true, remap = false },
    { "<leader>h",  'yiw:help |<C-r>|"<CR>',                                                                                          desc = "Get Help",              nowait = true, remap = false },
    { "<leader>r",  "<CMD>RunInTerminal<CR>",                                                                                         desc = "RunInTerminal",         nowait = true, remap = false },
    { "<leader>s",  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",                                                           desc = "Rename",                nowait = true, remap = false },
    { "<leader>u",  "<CMD>UndoTreeToggle<CR>",                                                                                        desc = "Toggle Undotree",       nowait = true, remap = false },
    { "<leader>x",  "<cmd>!chmod +x %<CR>",                                                                                           desc = "Make Executable",       nowait = true, remap = false },
    -- ["b"] = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers", },
    -- ["q"] = { "<cmd>lua require'main.keymapfunctions'.TODOLocList()<cr>", "Todo Location list" },
    -- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    --[[ ["f"] = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Find files",
    }, ]]

    { "<leader>d",  group = "DAP",                                                                                                    nowait = true,                  remap = false },
    { "<leader>db", ":lua require'dap'.continue()<CR>1<CR><CR>",                                                                      desc = "Start/Continue",        nowait = true, remap = false },
    { "<leader>di", ":lua require 'dap'.step_into()<CR>",                                                                             desc = "Step Into",             nowait = true, remap = false },
    { "<leader>dn", ":lua require 'dap'.step_over()<CR>",                                                                             desc = "Step Over",             nowait = true, remap = false },
    { "<leader>do", ":lua require 'dap'.step_out()<CR>",                                                                              desc = "Step Out",              nowait = true, remap = false },
    { "<leader>du", ":lua require 'dapui'.toggle()<CR>",                                                                              desc = "Toggle UI",             nowait = true, remap = false },
    { "<leader>dx", ":lua require 'dap'.terminate()<CR>",                                                                             desc = "Terminate",             nowait = true, remap = false },

    { "<leader>g",  group = "Git",                                                                                                    nowait = true,                  remap = false },
    { "<leader>gD", "<CMD>lua require'gitsings'.diffthis('~')<CR>",                                                                   desc = "Diff2",                 nowait = true, remap = false },
    { "<leader>gL", "<CMD>lua require'gitsings'.toggle_current_line_blame()<CR>",                                                     desc = "Toggle Blame",          nowait = true, remap = false },
    { "<leader>gR", "<CMD>lua require'gitsings'.reset_buffer()<CR>",                                                                  desc = "Reset Buffer",          nowait = true, remap = false },
    { "<leader>gS", "<CMD>lua require'gitsings'.stage_buffer()<CR>",                                                                  desc = "Stage Buffer",          nowait = true, remap = false },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>",                                                                                desc = "Checkout branch",       nowait = true, remap = false },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>",                                                                                 desc = "Checkout commit",       nowait = true, remap = false },
    { "<leader>gd", "<CMD>lua require'gitsings'.diffthis()<CR>",                                                                      desc = "Diff",                  nowait = true, remap = false },
    { "<leader>gl", "<CMD>lua require'gitsings'.blame_line{full=true}<CR>",                                                           desc = "Blame Line",            nowait = true, remap = false },
    { "<leader>go", "<cmd>Telescope git_status<cr>",                                                                                  desc = "Open changed file",     nowait = true, remap = false },
    { "<leader>gp", "<CMD>lua require'gitsings'.preview_hunk()<CR>",                                                                  desc = "Preview Hunk",          nowait = true, remap = false },
    { "<leader>gr", "<CMD>lua require'gitsings'.reset_hunk()<CR>",                                                                    desc = "Reset Hunk",            nowait = true, remap = false },
    { "<leader>gs", "<CMD>lua require'gitsings'.stage_hunk()<CR>",                                                                    desc = "Stage Hunk",            nowait = true, remap = false },
    { "<leader>gt", "<CMD>lua require'gitsings'.toggle_deleted()<CR>",                                                                desc = "Toggle Deleted",        nowait = true, remap = false },
    { "<leader>gu", "<CMD>lua require'gitsings'.undo_stage_hunk()<CR>",                                                               desc = "Undo Stage Hunk",       nowait = true, remap = false },
    -- TODO: Vgit?? jedenfalls lazygit
    --
    -- g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
    -- p = { "<cmd>VGit buffer_blame_preview<cr>", "Preview Hunk" },
    -- s = { "<cmd>VGit buffer_stage<cr>", "Stage buffer" },
    -- u = { "<cmd>VGit buffer_unstage<cr>", "Undo Stage Hunk" },
    -- h = { "<cmd>VGit buffer_history_preview<cr>", "buffer history" },
    --    d = {
    --      "<cmd>Gitsigns diffthis HEAD<cr>",
    --      "Diff",
    --    },

    { "<leader>l",  group = "LSP",                                                                                                    nowait = true,                  remap = false },
    { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>",                                                                         desc = "Goto declaration",      nowait = true, remap = false },
    { "<leader>lI", "<cmd>LspInstallInfo<cr>",                                                                                        desc = "Installer Info",        nowait = true, remap = false },
    { "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<CR>",                                                                               desc = "Hover",                 nowait = true, remap = false },
    { "<leader>lR", "<cmd>lua vim.lsp.buf.references()<CR>",                                                                          desc = "References",            nowait = true, remap = false },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",                                                               desc = "Workspace Symbols",     nowait = true, remap = false },
    { "<leader>lZ", "<cmd>lua vim.lsp.buf.signature_help()<CR>",                                                                      desc = "Signature help?",       nowait = true, remap = false },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                                                                         desc = "Code Action",           nowait = true, remap = false },
    { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>",                                                                          desc = "Goto definition",       nowait = true, remap = false },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async = true}<cr>zz",                                                                desc = "Format",                nowait = true, remap = false },
    { "<leader>li", "<cmd>LspInfo<cr>",                                                                                               desc = "Info",                  nowait = true, remap = false },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                                                                              desc = "Rename",                nowait = true, remap = false },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",                                                                        desc = "Document Symbols",      nowait = true, remap = false },
    { "<leader>lz", "<cmd>lua vim.lsp.buf.implementation()<CR>",                                                                      desc = "Implementations?",      nowait = true, remap = false },
    -- d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
    -- w = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
    -- j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
    -- k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    -- L = { "<<cmd>lua vim.diagnostic.open_float()<CR>", "float Diagnostic" },
    -- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },

    { "<leader>q",  group = "Quickfix",                                                                                               nowait = true,                  remap = false },
    { "<leader>qc", "<CMD>ccl<CR>",                                                                                                   desc = "Hide List",             nowait = true, remap = false },
    { "<leader>qd", "<cmd>lua vim.diagnostic.setqflist()<cr>",                                                                        desc = "Search Diagnostics",    nowait = true, remap = false },
    { "<leader>ql", "<CMD>cw<CR>",                                                                                                    desc = "Show List",             nowait = true, remap = false },
    { "<leader>qt", "<CMD>TodoQuickFix<CR>",                                                                                          desc = "Search Todo-Comments",  nowait = true, remap = false },
    { "<leader>qx", "cexpr []<CR><CMD>ccl<CR>",                                                                                       desc = "Empty List",            nowait = true, remap = false },

    { "<leader>R",  group = "Refactoring",                                                                                            nowait = true,                  remap = false },
    { "<leader>RB", "<CMD>lua require('refactoring').refactor('Extract Block To File')<CR>",                                          desc = "Extract Block to File", nowait = true, remap = false },
    { "<leader>RF", "<CMD>lua require('refactoring').refactor('Inline Function')<CR>",                                                desc = "Inline Fct",            nowait = true, remap = false },
    { "<leader>RV", "<CMD>lua require('refactoring').refactor('Inline Variable')<CR>",                                                desc = "Inline Variable",       nowait = true, remap = false },
    { "<leader>Rb", "<CMD>lua require('refactoring').refactor('Extract Block')<CR>",                                                  desc = "Extract Block",         nowait = true, remap = false },

    { "<leader>S",  group = "Search",                                                                                                 nowait = true,                  remap = false },
    { "<leader>SB", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers",               nowait = true, remap = false },
    { "<leader>SC", "<cmd>Telescope commands<cr>",                                                                                    desc = "Commands",              nowait = true, remap = false },
    { "<leader>SM", "<cmd>Telescope man_pages<cr>",                                                                                   desc = "Man Pages",             nowait = true, remap = false },
    { "<leader>SR", "<cmd>Telescope registers<cr>",                                                                                   desc = "Registers",             nowait = true, remap = false },
    { "<leader>Sb", "<cmd>Telescope git_branches<cr>",                                                                                desc = "Checkout branch",       nowait = true, remap = false },
    { "<leader>Sc", "<cmd>Telescope colorscheme<cr>",                                                                                 desc = "Colorscheme",           nowait = true, remap = false },
    { "<leader>Sh", "<cmd>Telescope help_tags<cr>",                                                                                   desc = "Find Help",             nowait = true, remap = false },
    { "<leader>Sk", "<cmd>Telescope keymaps<cr>",                                                                                     desc = "Keymaps",               nowait = true, remap = false },
    { "<leader>Sr", "<cmd>Telescope oldfiles<cr>",                                                                                    desc = "Open Recent File",      nowait = true, remap = false },
    { "<leader>St", "<cmd>TodoTelescope<CR>",                                                                                         desc = "Todo-Comments",         nowait = true, remap = false },

    { "<leader>t",  group = "Test",                                                                                                   nowait = true,                  remap = false },
    { "<leader>ts", ":lua require'neotest'.summary.toggle()<CR><C-W>l",                                                               desc = "Toggle Summary",        nowait = true, remap = false },

    { "<leader>T",  group = "Terminal",                                                                                               nowait = true,                  remap = false },
    { "<leader>Tf", "<cmd>ToggleTerm direction=float<cr>",                                                                            desc = "Float",                 nowait = true, remap = false },
    { "<leader>Th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>",                                                               desc = "Horizontal",            nowait = true, remap = false },
    { "<leader>Tn", "<cmd>lua _NODE_TOGGLE()<cr>",                                                                                    desc = "Node",                  nowait = true, remap = false },
    { "<leader>Tp", "<cmd>lua _PYTHON_TOGGLE()<cr>",                                                                                  desc = "Python",                nowait = true, remap = false },
    { "<leader>Tt", "<cmd>lua _HTOP_TOGGLE()<cr>",                                                                                    desc = "Htop",                  nowait = true, remap = false },
    { "<leader>Tu", "<cmd>lua _NCDU_TOGGLE()<cr>",                                                                                    desc = "NCDU",                  nowait = true, remap = false },
    { "<leader>Tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>",                                                                 desc = "Vertical",              nowait = true, remap = false },
}

local vmappings = { {
    mode = { "v" },

    { "<leader>/",  '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', desc = "Comment",                  nowait = true, remap = false },
    { "<leader>H",  'y<ESC>:helpg <C-r>"<CR>',                                                       desc = "Get helpgrep",             nowait = true, remap = false },
    { "<leader>h",  'y<ESC>:help |<C-r>|"<CR>',                                                      desc = "Get help",                 nowait = true, remap = false },

    { "<leader>R",  group = "Refactoring" },
    { "<leader>RV", "<CMD>lua require('refactoring').refactor('Inline Variable')<CR>",               desc = "Inline Variable",          nowait = true, remap = false },
    { "<leader>Re", "<CMD>lua require('refactoring').refactor('Extract Function To File')<CR>",      desc = "Extract Function to File", nowait = true, remap = false },
    { "<leader>Rf", "<CMD>lua require('refactoring').refactor('Extract Function')<CR>",              desc = "Extract Function",         nowait = true, remap = false },
    { "<leader>Rv", "<CMD>lua require('refactoring').refactor('Extract Variable')<CR>",              desc = "Extract Variable",         nowait = true, remap = false },

    { "<leader>z",  group = "Folds",                                                                 nowait = true,                     remap = false },
    { "<leader>zf", ":'<,'>fold<CR>",                                                                desc = "create Fold",              nowait = true, remap = false },
} }

local braccopts = {
    mode = "n",
    prefix = "]",
    buffer = nil,
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local braccmappings = { {
    { "[b", "<CMD>lua require('goto-breakpoints').prev()<CR>",  desc = "Breakpoint",     nowait = true, remap = false },
    { "[c", "<CMD> lua require'gitsigns'.prev_hunk()<CR>",      desc = "Git Hunk",       nowait = true, remap = false },
    { "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>",          desc = "LSP Diagnostic", nowait = true, remap = false },
    { "[t", "<CMD> lua require'todo-comments'.jump_prev()<CR>", desc = "Todo-Comment",   nowait = true, remap = false },
} }

local bracoopts = {
    mode = "n",
    prefix = "[",
    buffer = nil,
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local bracomappings = { {
    { "]S", "<CMD>lua require('goto-breakpoints').stopped()<CR>", desc = "Debug stopped",  nowait = true, remap = false },
    { "]b", "<CMD>lua require('goto-breakpoints').next()<CR>",    desc = "Breakpoint",     nowait = true, remap = false },
    { "]c", "<CMD> lua require'gitsigns'.next_hunk()<CR>",        desc = "Git Hunk",       nowait = true, remap = false },
    { "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>",            desc = "LSP Diagnostic", nowait = true, remap = false },
    { "]t", "<CMD> lua require'todo-comments'.jump_next()<CR>",   desc = "Todo-Comment",   nowait = true, remap = false },
} }

which_key.add(nmappings)
which_key.add(vmappings)
which_key.add(bracomappings)
which_key.add(braccmappings)
