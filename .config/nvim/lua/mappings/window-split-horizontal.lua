local M = {}

M.key = 'sh'
M.modes = { 'n' }
M.command = ':split<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

