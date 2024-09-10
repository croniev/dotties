-- Find the first folder of the filepath and cd into it if not in file dir already.
vim.api.nvim_create_user_command('CdParentUnderPwd',
    function()
        local pwd = vim.fn.expand('%:h')
        local newd = nil
        if pwd ~= "." then
            local i, j = tostring(pwd):find ".-/"
            if i ~= nil then
                newd = string.sub(tostring(pwd), i, j - 1)
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
    function()
        local file = vim.fn.expand('%')
        local extension = vim.fn.expand('%:e:e')
        local commands = {}
        commands["py"] = { cmd = "python", term = true }
        commands["sh"] = { cmd = "bash", term = true }
        commands["js"] = { cmd = "node", term = true }
        commands["html"] = { cmd = "firefox --new-window", after = 'tabclose', term = true }
        commands["css"] = { cmd = "firefox --new-window", file = 'index.html', after = 'tabclose', term = true }
        commands["tex"] = { cmd = "VimtexCompile" }
        commands["ju.py"] = { cmd = "MyJupynium" }
        -- If there is action for filetype
        if commands[extension] then
            local cmd = commands[extension]["cmd"]
            -- If action is not to be performed in shell
            if not commands[extension]["term"] then
                vim.cmd(cmd)
                return
            else -- Action is to be performed in shell
                -- Check if venv/exec is specified (like so: 'exec=/path/to/executable')
                local firstLine = tostring(vim.fn.getline(1))
                local execS, execE = string.find(firstLine, "exec=")
                if execS then
                    cmd = string.sub(firstLine, execE + 1)
                end
                vim.cmd("tabnew " .. file)
                if commands[extension]["file"] then
                    file = commands[extension]["file"]
                end
                -- TODO: an floatterm anpassen :)
                vim.cmd("term " .. cmd .. ' ' .. file)
                if commands[extension]["after"] then
                    vim.cmd(commands[extension]["after"])
                end
            end
        else
            print("Unknown filetype for running in terminal!")
        end
    end,
    {})

vim.api.nvim_create_user_command('ToggleWrap',
    function()
        local status = vim.o.wrap
        print(status)
        if status then
            vim.cmd('set nowrap')
        else
            vim.cmd('set wrap')
        end
    end,
    {})

vim.api.nvim_create_user_command('MyJupynium',
    function()
        vim.cmd("JupyniumStartAndAttachToServer")
        vim.wait(3000)
        vim.cmd("JupyniumStartSync")
    end,
    {})

-- Set mapping for git-conflict when a conflict is detected
vim.api.nvim_create_autocmd('User', {
    pattern = 'GitConflictDetected',
    callback = function()
        vim.notify('Conflict detected in ' .. vim.fn.expand('<afile>'))
        vim.keymap.set('n', 'cww', function()
            engage.conflict_buster()
            create_buffer_local_mappings()
        end)
    end
})

-- Startup shit to go around bugs
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    command = "source ~/.config/nvim/after/plugin/lsp.lua"
})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    command = "lua require'flash'.setup()"
})
