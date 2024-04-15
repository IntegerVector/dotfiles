local M = {}

M.set_tab_size = function(size)
  local _size = (type(size) == 'string') and tonumber(size) or size

  vim.opt.tabstop = _size
  vim.opt.shiftwidth = _size
  vim.opt.softtabstop = _size
end

M.set_file_format = function(format)
  vim.opt.fileformat = format
end

M.copy_file_name = function()
  vim.cmd [[ :let @+ = expand('%:t') ]]
end

M.copy_file_path = function()
  vim.cmd [[ :let @+ = expand('%') ]]
end

M.copy_file_full_path = function()
  vim.cmd [[ :let @+ = expand('%:p') ]]
end

return M

