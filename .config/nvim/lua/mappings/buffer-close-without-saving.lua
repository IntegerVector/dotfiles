local M = {}

M.key = 'q'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = '<Cmd>bdelete!<CR>'

return M

