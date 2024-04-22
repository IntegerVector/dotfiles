local M = {}

M.set_format = function(format)
  vim.opt.fileformat = format
end

M.copy_name = function()
  vim.cmd [[ :let @+ = expand('%:t') ]]
end

M.copy_path = function()
  vim.cmd [[ :let @+ = expand('%') ]]
end

M.copy_full_path = function()
  vim.cmd [[ :let @+ = expand('%:p') ]]
end

return M

