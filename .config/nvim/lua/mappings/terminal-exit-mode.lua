local M = {}

M.key = '<Esc>'
M.modes = { 't' }
M.command = '<C-\\><C-n>'
M.options = { noremap = true, silent = true, expr = false }

return M

