require("neotest").setup({
  adapters = {
    require("neotest-python")({
            dap = {
                justMyCode = false,
                -- python = "~/.venv/debugpy/bin/python",
            },
            args = {"--log-level", "DEBUG"},
            runner = "pytest",
            -- python = "/home/croniev/.venv/debugpy/bin/coverage run",
            is_test_file = function (path) -- only test files which contain 'test' in the path
                if path:find('test') then
                    return true
                else
                    return false
                end
            end,
        })
  },
})

-- TODO: Coverage file generation and loading in python not working
require("coverage").setup({
    commands = true,

})
