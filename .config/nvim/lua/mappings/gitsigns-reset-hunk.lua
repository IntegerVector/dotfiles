local M = {}

local gs = package.loaded.gitsigns
local buffer = package.loaded.gitsigns.custom_buffer

M.key = '<leader>gr'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false, buffer = buffer, desc = 'gitsigns: reset hunk' }
M.action = gs.reset_hunk

return M

