local M = {}

M.key = 'st'
M.modes = { 'n' }
M.command = ':tabedit<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

