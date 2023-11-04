require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
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
-- vim.keymap.set('n', '<A-K>', require'dap.ui.widgets'.hover)
map('n', '<A-K>', require'dapui'.eval, opts)
map('v', '<A-K>', require'dapui'.eval, opts)
map('n', '<leader>dbb', require 'dap'.continue, opts)
map('n', '<leader>db', ":lua require'dap'.continue()<CR>1<CR><CR>", opts)
map('n', '<leader>dn', require 'dap'.step_over, opts)
map('n', '<leader>di', require 'dap'.step_into, opts)
map('n', '<leader>do', require 'dap'.step_out, opts)
map('n', '<leader>-', require 'dap'.toggle_breakpoint, opts)
map('n', '<leader>dx', require 'dap'.terminate, opts)
map('n', '<leader>du', require 'dapui'.toggle, opts)
map('n', ']b', require('goto-breakpoints').next, opts)
map('n', '[b', require('goto-breakpoints').prev, opts)
map('n', ']S', require('goto-breakpoints').stopped, opts)
