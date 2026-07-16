local M = {}

M.name = 'FileFormat'
M.options = { nargs = 1 }
M.action = function(opts)
  if opts == nil or opts.args == nil then
    return
  end

  vim.opt.fileformat = opts.args
end

return M

