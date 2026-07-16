local M = {}

M.key = '<Leader><up>'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = '5<C-w>+'

return M

