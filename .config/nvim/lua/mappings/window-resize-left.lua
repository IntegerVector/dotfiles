local M = {}

M.key = '<Leader><left>'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = '20<C-w><'

return M

