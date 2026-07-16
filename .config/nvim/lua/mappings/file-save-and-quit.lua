local M = {}

M.key = '<Leader>q'
M.modes = { 'n' }
M.command = ':w | bd<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

