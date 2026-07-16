local M = {}

M.name = 'Copy'
M.options = { nargs = 1 }
M.action = function(opts)
  if opts == nil or opts.args == nil then
    return
  end

  if opts.args == 'name' then
    vim.cmd [[ :let @+ = expand('%:t') ]]
  end

  if opts.args == 'path' then
    vim.cmd [[ :let @+ = expand('%') ]]
  end

  if opts.args == 'fullpath' then
    vim.cmd [[ :let @+ = expand('%:p') ]]
  end
end

return M

