local M = {}

M.key = '<Leader>q'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':w | bd<Return>'

return M

