local M = {}

M.key = 'sv'
M.modes = { 'n' }
M.command = ':vsplit<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

