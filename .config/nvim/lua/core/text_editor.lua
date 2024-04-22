local M = {}

M.set_tab_size = function(size)
  local _size = tonumber(size)

  vim.opt.tabstop = _size
  vim.opt.shiftwidth = _size
  vim.opt.softtabstop = _size
end

return M

