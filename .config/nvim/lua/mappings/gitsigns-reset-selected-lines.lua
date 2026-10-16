local M = {}

local gs = package.loaded.gitsigns
local buffer = package.loaded.gitsigns.custom_buffer

M.key = '<leader>gr'
M.modes = { 'v' }
M.options = { noremap = true, silent = true, expr = false, buffer = buffer, desc = 'gitsigns: reset selected lines' }
M.action = function()
  gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end

return M

