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
