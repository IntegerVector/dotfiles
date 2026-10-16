local M = {}

local gs = package.loaded.gitsigns
local buffer = package.loaded.gitsigns.custom_buffer

M.key = '<leader>gb'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false, buffer = buffer, desc = 'gitsigns: toggle line blame' }
M.action = gs.toggle_current_line_blame

return M

