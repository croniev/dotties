-- Find the first folder of the filepath and cd into it if not in file dir already.
vim.api.nvim_create_user_command('CdParentUnderPwd',
    function()
        local pwd = vim.fn.expand('%:h')
        local newd = nil
        if pwd ~= "." then
            local i,j = tostring(pwd):find ".-/"
            if i ~= nil then
                newd = string.sub(tostring(pwd), i, j-1)
            else
                newd = pwd
            end
        end
        if newd ~= nil then
            vim.cmd("cd " .. newd)
        end
    end,
    {})

-- Opens a new tab and runs the file according to its filetype in a terminal emulator.
vim.api.nvim_create_user_command('RunInTerminal',
    function ()
        local file = vim.fn.expand('%')
        local extension = vim.fn.expand('%:e')
        local commands = {}
        commands["py"] = {cmd = "python", term = true}
        commands["sh"] = {cmd = "bash", term = true}
        commands["js"] = {cmd = "node", term = true}
        commands["html"] = {cmd = "firefox --new-window", after = 'tabclose', term = true}
        commands["css"] = {cmd = "firefox --new-window index.html", complete = true, after = 'tabclose', term = true}
        commands["tex"] = {cmd = "VimtexCompile"}
        if not commands[extension]["term"] then
            vim.cmd(commands[extension]["cmd"])
            return
        end
        if commands[extension] then
            vim.cmd("tabnew " .. file)
            if commands[extension]["complete"] then
                file = ""
            end
            vim.cmd("term " .. commands[extension]["cmd"] .. ' ' .. file)
            if commands[extension]["after"] then
                vim.cmd(commands[extension]["after"])
            end
        else
            print("Unknown filetype for running in terminal!")
        end
    end,
    {})

-- Set mapping for git-conflict when a conflict is detected
vim.api.nvim_create_autocmd('User', {
  pattern = 'GitConflictDetected',
  callback = function()
    vim.notify('Conflict detected in '..vim.fn.expand('<afile>'))
    vim.keymap.set('n', 'cww', function()
      engage.conflict_buster()
      create_buffer_local_mappings()
    end)
  end
})
