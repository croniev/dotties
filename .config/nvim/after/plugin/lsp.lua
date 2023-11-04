local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'rust_analyzer',
    'pylsp'
})

-- Fix Undefined global 'vim'
require('lspconfig').lua_ls.setup {
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

lsp.configure('pylsp', {
    settings = {
        pylsp = {
            configurationSources = { 'flake8' },
            plugins = {
                pycodestyle = {},
                flake8 = {
                    enabled = true,
                    ignore = { "E501",
                        "F401",
                    },
                }
            }
        }
    }
})

require('lspconfig').clangd.setup {
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

-- LuaSnip keymaps
local ls = require('luasnip')
-- vim.keymap.set({ "i" }, "<Tab>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i" }, "<Tab>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump() end
    end, { remap = false, silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = ''
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = true, silent = true}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("i", "<A-f>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<cr>zz") -- Formattieren
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
