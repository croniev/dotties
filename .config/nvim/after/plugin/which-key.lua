local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	print("blaifbaisluf")
    return
end
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    presets = {
        z = true,
    },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        n = {"s"},
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local nmappings = {
    ["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Comment" },
    ["-"] = { ":lua require 'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint"},
    ["a"] = { "<cmd>lua require'harpoon.mark'.add_file()<cr>", "Add to Harpoon" },
    -- ["b"] = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers", },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    ["w"] = { "<cmd>w!<CR>", "Save" },
    -- ["q"] = { "<cmd>lua require'main.keymapfunctions'.TODOLocList()<cr>", "Todo Location list" },
    -- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    --[[ ["f"] = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Find files",
    }, ]]
    ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Live Grep" },
    ["P"] = { "<cmd>Telescope workspaces<cr>", "Projects/Workspaces" },
    ["u"] = { "<CMD>UndoTreeToggle<CR>", "Toggle Undotree" },

    d = {
        name = "DAP",
        b = { ":lua require'dap'.continue()<CR>1<CR><CR>", "Start/Continue" },
        n = { ":lua require 'dap'.step_over()<CR>", "Step Over" },
        i = { ":lua require 'dap'.step_into()<CR>", "Step Into" },
        o = { ":lua require 'dap'.step_out()<CR>", "Step Out" },
        x = { ":lua require 'dap'.terminate()<CR>", "Terminate" },
        u = { ":lua require 'dapui'.toggle()<CR>", "Toggle UI" },
        -- TODO: Logpoints and CBreakpoints
    },

    g = {
        name = "Git",
        -- TODO: Vgit?? jedenfalls lazygit
        --[[ g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
        p = { "<cmd>VGit buffer_blame_preview<cr>", "Preview Hunk" },
        s = { "<cmd>VGit buffer_stage<cr>", "Stage buffer" },
        u = { "<cmd>VGit buffer_unstage<cr>", "Undo Stage Hunk" },
        h = { "<cmd>VGit buffer_history_preview<cr>", "buffer history" }, ]]
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        --    d = {
        --      "<cmd>Gitsigns diffthis HEAD<cr>",
        --      "Diff",
        --    },
    },

    h = {
        name = "Gitsigns",
        s = { "<CMD>lua require'gitsings'.stage_hunk()<CR>", "Stage Hunk" },
        r = { "<CMD>lua require'gitsings'.reset_hunk()<CR>", "Reset Hunk" },
        S = { "<CMD>lua require'gitsings'.stage_buffer()<CR>", "Stage Buffer" },
        u = { "<CMD>lua require'gitsings'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
        R = { "<CMD>lua require'gitsings'.reset_buffer()<CR>", "Reset Buffer" },
        p = { "<CMD>lua require'gitsings'.preview_hunk()<CR>", "Preview Hunk" },
        b = { "<CMD>lua require'gitsings'.blame_line{full=true}<CR>", "Blame Line" },
        B = { "<CMD>lua require'gitsings'.toggle_current_line_blame()<CR>", "Toggle Blame" },
        d = { "<CMD>lua require'gitsings'.diffthis()<CR>", "Diff" },
        D = { "<CMD>lua require'gitsings'.diffthis('~')<CR>", "Diff2" },
        t = { "<CMD>lua require'gitsings'.toggle_deleted()<CR>", "Toggle Deleted" },
    },

    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
        K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover" },
        -- d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        -- w = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = { "<cmd>lua vim.lsp.buf.format{async = true}<cr>zz", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        -- j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
        -- k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        -- L = { "<<cmd>lua vim.diagnostic.open_float()<CR>", "float Diagnostic" },
        -- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        R = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        z = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementations?" },
        Z = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help?" },
    },

    m = {
        name = "my stuff",
    },

    q = {
        name = "Quickfix",
        d = { "<cmd>lua vim.diagnostic.setqflist()<cr>", "Search Diagnostics" },
        t = { "<CMD>TodoQuickFix<CR>", "Search Todo-Comments"}
    },

    r = {
        name = "Refactoring",
        F = { "<CMD>lua require('refactoring').refactor('Inline Function')<CR>", "Inline Fct" },
        V = { "<CMD>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
        b = { "<CMD>lua require('refactoring').refactor('Extract Block')<CR>", "Extract Block" },
        B = { "<CMD>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract Block to File" },
    },

    S = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        B = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers", },
        t = { "<cmd>TodoTelescope<CR>", "Todo-Comments"},
    },

    t = {
        name = "Test",
        s = { ":lua require'neotest'.summary.toggle()<CR><C-W>l", "Toggle Summary" },
    },

    T = {
        name = "Terminal",
        -- TODO: Terminal sachen
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
        t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },
}

local vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local vmappings = {
    ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment" },

    r = {
        f = { "<CMD>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
        e = { "<CMD>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract Function to File" },
        v = { "<CMD>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
        V = { "<CMD>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
    },

    z = {
        name = "Folds",
        f = { ":'<,'>fold<CR>", "create Fold" },
    },
}

local braccopts = {
    mode = "n",
    prefix = "]",
    buffer = nil,
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local braccmappings = {
    ["d"] = { '<CMD>lua vim.diagnostic.goto_next()<CR>', "LSP Diagnostic"},
    ["b"] = { "<CMD>lua require('goto-breakpoints').next()<CR>", "Breakpoint" },
    ["S"] = { "<CMD>lua require('goto-breakpoints').stopped()<CR>", "Debug stopped"},
    ["c"] = { "<CMD> lua require'gitsigns'.next_hunk()<CR>", "Git Hunk" },
    ["t"] = { "<CMD> lua require'todo-comments'.jump_next()<CR>", "Todo-Comment" }
}

local bracoopts = {
    mode = "n",
    prefix = "[",
    buffer = nil,
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local bracomappings = {
    ["d"] = { '<CMD>lua vim.diagnostic.goto_next()<CR>', "LSP Diagnostic"},
    ["b"] = { "<CMD>lua require('goto-breakpoints').next()<CR>", "Breakpoint" },
    ["c"] = { "<CMD> lua require'gitsigns'.prev_hunk()<CR>", "Git Hunk" },
    ["t"] = { "<CMD> lua require'todo-comments'.jump_prev()<CR>", "Todo-Comment" }
}

which_key.setup(setup)
which_key.register(nmappings, opts)
which_key.register(vmappings, vopts)
which_key.register(bracomappings, bracoopts)
which_key.register(braccmappings, braccopts)
