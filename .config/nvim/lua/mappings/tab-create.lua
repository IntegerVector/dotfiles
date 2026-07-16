local M = {}

M.key = 'st'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':tabedit<Return>'

return M

