local M = {}

M.key = 'sv'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':vsplit<Return>'

return M

