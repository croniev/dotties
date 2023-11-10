local lsp = require("lsp-zero")
local lspcnfg = require('lspconfig')

lsp.setup()

lsp.preset("manual-setup")
require('mason').setup()
-- use :Mason to managa language servers

require("mason-lspconfig").setup({
    ensure_installed = {
        "texlab",
        "eslint",
        "html",
        "lua_ls",
        "rust_analyzer",
    },
})

lspcnfg.eslint.setup({
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

lspcnfg.tsserver.setup({})

-- Fix Undefined global 'vim'
lspcnfg.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
        }
    }
}

lspcnfg.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                yapf = { enabled = true },
                pyflakes = { enabled = true },
                mccabe = { enabled = false },
                pycodestyle = {
                    enabled = true,
                    ignore = { 'E501', 'F401' }
                },
                flake8 = { enabled = false },
                isort = { enabled = true },
            }
        }
    }
}

lspcnfg.clangd.setup {
    ---@diagnostic disable-next-line: unused-local
    on_attach = function(client, buffer)
        vim.api.nvim_create_autocmd("LspTokenUpdate", {
            buffer = buffer,
            callback = show_unconst_caps,
        })
        -- other on_attach logic
    end
}

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-l>'] = cmp.mapping.confirm({ select = true }),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = ''
    }
})

---@diagnostic disable-next-line: unused-local
local opts = { remap = true, silent = true }
-- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("i", "<A-f>", function() vim.lsp.buf.signature_help() end, opts)

vim.diagnostic.config({
    virtual_text = true
})
