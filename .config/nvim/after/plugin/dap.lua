require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
---@diagnostic disable-next-line: undefined-field
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--     dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--     dapui.close()
-- end

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapBreakpointCondition',{ text ='🈵', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapLogPoint',{ text ='ℹ️', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapBreakpointRejected',{ text ='🆘', texthl ='', linehl ='', numhl =''})

local opts = {noremap = true, silent = true}
local map = vim.keymap.set
map('n', '<A-K>', require'dapui'.eval, opts)
map('v', '<A-K>', require'dapui'.eval, opts)
---@diagnostic disable-next-line: undefined-field
map('n', '<leader>dbb', require 'dap'.continue, opts)
-- vim.keymap.set('n', '<A-K>', require'dap.ui.widgets'.hover)
