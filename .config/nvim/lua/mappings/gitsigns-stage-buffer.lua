local M = {}

local gs = package.loaded.gitsigns
local buffer = package.loaded.gitsigns.custom_buffer

M.key = '<leader>gS'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false, buffer = buffer, desc = 'gitsigns: stage buffer' }
M.action = gs.stage_buffer

return M

