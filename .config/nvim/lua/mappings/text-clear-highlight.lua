local M = {}

M.key = '<Esc>'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':noh<Return>'

return M

