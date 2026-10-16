local M = {}

local buffer = package.loaded.gitsigns.custom_buffer

M.key = '<Leader>gh'
M.modes = { 'o', 'x' }
M.options = { noremap = true, silent = true, expr = false, buffer = buffer, desc = 'gitsigns: select hunk' }
M.action = '<Cmd>Gitsigns select_hunk<CR>'

return M

