local M = {}

local gs = package.loaded.gitsigns
local buffer = package.loaded.gitsigns.custom_buffer

M.key = '<leader>gs'
M.modes = { 'v' }
M.options = { noremap = true, silent = true, expr = false, buffer = buffer, desc = 'gitsigns: stage selected lines' }
M.action = function()
  gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end

return M

