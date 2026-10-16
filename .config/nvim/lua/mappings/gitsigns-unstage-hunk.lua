local M = {}

local gs = package.loaded.gitsigns
local buffer = package.loaded.gitsigns.custom_buffer

M.key = '<leader>gu'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false, buffer = buffer, desc = 'gitsigns: unstage hunk' }
M.action = gs.undo_stage_hunk

return M

