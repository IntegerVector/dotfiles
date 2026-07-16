local M = {}

M.key = '<Esc>'
M.modes = { 'n' }
M.command = ':noh<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

