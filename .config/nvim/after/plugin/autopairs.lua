local Rule = require('nvim-autopairs.rule')
local npairs = require("nvim-autopairs")

npairs.setup({
    check_ts = true,
    enable_check_bracket_line = true,
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
    fast_wrap = {},
})

-- local cond = require('nvim-autopairs.conds')
-- local utils = require('nvim-autopairs.utils')

--[[ local function multiline_close_jump(open, close)
    return Rule(close, '')
        :with_pair(function()
            local row, col = utils.get_cursor(0)
            local line = utils.text_get_current_line(0)

            if #line ~= col then --not at EOL
                return false
            end

            local unclosed_count = 0
            for c in line:gmatch("[\\" .. open .. "\\" .. close .. "]") do
                if c == open then unclosed_count = unclosed_count + 1 end
                if unclosed_count > 0 and c == close then unclosed_count = unclosed_count - 1 end
            end
            if unclosed_count > 0 then return false end

            local nextrow = row + 1
            if nextrow < vim.api.nvim_buf_line_count(0)
                and vim.regex("^\\s*" .. close):match_line(0, nextrow) then
                return true
            end
            return false
        end)
        :with_move(cond.none())
        :with_cr(cond.none())
        :with_del(cond.none())
        :set_end_pair_length(0)
        :replace_endpair(function(opts)
---@diagnostic disable-next-line: unused-local
            local row, _col = utils.get_cursor(0)
            local action = vim.regex("^" .. close):match_line(0, row + 1) and "a" or ("0f%sa"):format(opts.char)
            return ("<esc>dd%s"):format(action)
        end)
end

npairs.add_rules {
    multiline_close_jump('(', ')'),
    multiline_close_jump('[', ']'),
    multiline_close_jump('{', '}'),
} ]]
