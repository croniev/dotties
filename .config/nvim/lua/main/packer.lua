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

    -- NOTE: Make Nvim understandable
    use("nvim-lua/popup.nvim")
    use("folke/which-key.nvim")

    -- NOTE: Files
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} },
        file_ignore_patterns = { ".aux" } }

    use("theprimeagen/harpoon")

    use { 'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons', },
        config = function() require("nvim-tree").setup {} end }

    -- NOTE: Highlighting
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/playground"
    use "nvim-treesitter/nvim-treesitter-context"
    use "p00f/nvim-ts-rainbow" -- color for parenthesis
    use "andymass/vim-matchup" -- klammern
    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" } -- To-do comments TODO: Get icons working correctly
    use "RRethy/vim-illuminate" -- highlight other uses of the word

    -- NOTE: Semantics
    use { 'VonHeikemen/lsp-zero.nvim', branch = 'v1.x', requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'}, -- completion plugin
            {'hrsh7th/cmp-buffer'}, -- buffer completion
            {'hrsh7th/cmp-path'}, -- path completion
            {'saadparwaiz1/cmp_luasnip'}, -- snippet completion
            {'hrsh7th/cmp-nvim-lsp'}, -- cmdline completions
            {'hrsh7th/cmp-nvim-lua'}, -- cmdline completions
            {'hrsh7th/cmp-cmdline'}, -- cmdline completions
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'}, -- premade collection of snippets
    } }

    -- NOTE: Writing
    use("lervag/vimtex") --latex
    use {'numToStr/Comment.nvim', config = function() require('Comment').setup() end } --Toggle comments
    -- HACK: plugin for CSS: https://github.com/rstacruz/vim-hyperstyle 
    use('rstacruz/vim-closer') -- Automatically close brackets 
    use({ "kylechui/nvim-surround", -- commands for adding and removing brackets and quotes
        tag = "*", config = function()
            require("nvim-surround").setup({
                move_cursor = false, }) end })

    -- NOTE: Workflow
    use("mbbill/undotree")
    -- GIT 
    use {'lewis6991/gitsigns.nvim'}
    use {'akinsho/git-conflict.nvim', tag = "*", config = function() require('git-conflict').setup() end}

    -- NOTE: Style
    use 'folke/tokyonight.nvim'

    -- NOTE: Not sure
    use{ "folke/trouble.nvim",
        config = function() require("trouble").setup {
                icons = false, } end }

    use("theprimeagen/refactoring.nvim")
    use("tpope/vim-fugitive")
    use("folke/zen-mode.nvim")
    use("github/copilot.vim")
    use("eandrju/cellular-automaton.nvim")
    use("laytan/cloak.nvim")

end)
