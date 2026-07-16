local M = {}

M.key = 'sh'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':split<Return>'

return M

