require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

vim.keymap.set('n', '<leader>K', require'dap.ui.widgets'.hover)
vim.keymap.set('n', '<leader>dbb', require 'dap'.continue)
vim.keymap.set('n', '<leader>db', ":lua require'dap'.continue()<CR>1<CR><CR>")
vim.keymap.set('n', '<leader>dn', require 'dap'.step_over)
vim.keymap.set('n', '<leader>di', require 'dap'.step_into)
vim.keymap.set('n', '<leader>do', require 'dap'.step_out)
vim.keymap.set('n', '<leader>-', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>dx', require 'dap'.terminate)
vim.keymap.set('n', '<leader>du', require 'dapui'.toggle)
vim.keymap.set('n', ']b', require('goto-breakpoints').next, {})
vim.keymap.set('n', '[b', require('goto-breakpoints').prev, {})
vim.keymap.set('n', ']S', require('goto-breakpoints').stopped, {})
