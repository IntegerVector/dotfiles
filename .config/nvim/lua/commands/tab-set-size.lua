local M = {}

M.name = 'Tab'
M.options = { nargs = 1 }
M.action = function(opts)
  if opts == nil or opts.args == nil then
    return
  end

  local size = tonumber(opts.args)

  vim.opt.tabstop = size
  vim.opt.shiftwidth = size
  vim.opt.softtabstop = size
end

return M

