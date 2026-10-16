local M = {}

local gs = package.loaded.gitsigns
local buffer = package.loaded.gitsigns.custom_buffer

M.key = '<leader>gU'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false, buffer = buffer, desc = 'gitsigns: unstage buffer' }
M.action = gs.reset_buffer_index

return M

