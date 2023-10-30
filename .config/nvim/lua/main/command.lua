vim.api.nvim_create_user_command('CdParentUnderPwd',
    function()
        local pwd = vim.fn.expand('%:h')
        local newd = nil
        if pwd ~= "." then
            local i,j = pwd:find ".-/"
            if i ~= nil then
                newd = string.sub(pwd, i, j-1)
            else
                newd = pwd
            end
        end
        vim.cmd("cd " .. newd)
    end,
    {})

vim.api.nvim_create_user_command('RunInTerminal',
    function ()
        local file = vim.fn.expand('%')
        local extension = vim.fn.expand('%:e')
        local commands = {}
        commands["py"] = "python"
        commands["sh"] = "bash"
        commands["js"] = "node"
        if commands[extension] then
            vim.cmd("tabnew " .. file)
            vim.cmd("term " .. commands[extension] .. ' ' .. file)
        else
            print("Unknown filetype for running in terminal!")
        end
    end,
    {})
