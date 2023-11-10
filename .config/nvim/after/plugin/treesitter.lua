require'nvim-treesitter.configs'.setup {
    modules = {}, ignore_install = {},
    -- A list of parser names, or "all"
    ensure_installed =  'all',

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, },
    matchup = {
        enable = true,
        -- disable = {},
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    autotag = {
        enable = true,
    }
}
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
}
