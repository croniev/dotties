-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- update: `:so` and then `:PackerSync`

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require('packer').startup(function(use)
    -- TODO: Look at all that https://github.com/rockerBOO/awesome-neovim/blob/main/README.md recommends

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- NOTE: Nvim functionalitites
    use("nvim-lua/popup.nvim")
    use("folke/which-key.nvim")
    use("folke/zen-mode.nvim")
    use("eandrju/cellular-automaton.nvim")
    use("goolord/alpha-nvim")
    -- TODO: term

    -- NOTE: Files
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { 'nvim-lua/plenary.nvim' } }
    use("theprimeagen/harpoon")
    use { 'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons', }, }

    -- NOTE: Highlighting
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/nvim-treesitter-context"
    use "p00f/nvim-ts-rainbow"                                             -- color for parenthesis
    use "andymass/vim-matchup"                                             -- klammern
    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" } -- To-do comments
    -- use "RRethy/vim-illuminate"  -- highlight other uses of the word -- Macht nvim sehr langsam lol

    -- NOTE: Semantics
    use { 'VonHeikemen/lsp-zero.nvim', branch = 'v1.x', requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },         -- completion plugin
        { 'hrsh7th/cmp-buffer' },       -- buffer completion
        { 'hrsh7th/cmp-path' },         -- path completion
        { 'saadparwaiz1/cmp_luasnip' }, -- snippet completion
        { 'hrsh7th/cmp-nvim-lsp' },     -- nvim lsp completions
        { 'hrsh7th/cmp-nvim-lua' },     -- nvim lua API completions
        { 'hrsh7th/cmp-cmdline' },      -- cmdline completions
        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' }, -- premade collection of snippets
    } }

    -- NOTE: Writing
    use("lervag/vimtex")                                                                                 --latex
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup({ ignore = '^$' }) end } --Toggle comments
    use 'rstacruz/vim-hyperstyle'
    use 'windwp/nvim-autopairs'
    use "windwp/nvim-ts-autotag"                                           -- close HTML brackets
    use({
        "kylechui/nvim-surround",   -- adding, changing and removing braces
        tag = "*",
        config = function()
            require("nvim-surround").setup({
                move_cursor = false, })
        end
    })
    use { "nat-418/boole.nvim", config = function() -- Increment not just numbers but also bools and dates
        require('boole').setup()
    end }
    use("mbbill/undotree")
    use("theprimeagen/refactoring.nvim")

    -- NOTE: Workflow

    -- GIT
    use { 'lewis6991/gitsigns.nvim' }
    use { 'akinsho/git-conflict.nvim', tag = "*", config = function() require('git-conflict').setup({}) end } -- TODO: testen
    -- use("tpope/vim-fugitive") -- git sachen TODO: brauche ich das?

    -- DEBUGGING
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'                                                                                    -- Shortcuts for displaying all dap elements
    use { 'theHamsta/nvim-dap-virtual-text', config = function() require('nvim-dap-virtual-text').setup({}) end } -- Show values of variables inline during debugging
    use { 'mfussenegger/nvim-dap-python',
        config = function() require('dap-python').setup('~/.venv/debugpy/bin/python') end }
    use 'ofirgall/goto-breakpoints.nvim' -- Jump between breakpoints

    -- TODO: this plugin is not working
    -- use {'Weissle/persistent-breakpoints.nvim', config = function() require('persistent-breakpoints') -- Save and load breakpoints on document close and open
    --     .setup{load_breakpoints_event = { "BufReadPost" }} end }

    --  TESTING
    use { "nvim-neotest/neotest",
        requires = { "nvim-lua/plenary.nvim", "antoinemadec/FixCursorHold.nvim" } }
    use 'nvim-neotest/neotest-python'
    use { "andythigpen/nvim-coverage", requires = "nvim-lua/plenary.nvim", } -- TODO: not working

    -- NOTE: Style
    use 'nvim-tree/nvim-web-devicons'
    use 'folke/tokyonight.nvim'
    use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
    use 'blueyed/vim-diminactive'
end)
