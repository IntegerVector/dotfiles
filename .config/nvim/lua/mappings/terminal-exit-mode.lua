local M = {}

M.key = '<Esc>'
M.modes = { 't' }
M.options = { noremap = true, silent = true, expr = false }
M.action = '<C-\\><C-n>'

return M

