local M = {}

M.name = 'Theme'
M.options = { nargs = 1 }
M.action = function(opts)
  if opts == nil or opts.args == nil then
    return
  end

  if opts.args == 'light' then
    vim.cmd [[ colorscheme dawnfox ]]
  end

  if opts.args == 'dark' then
    vim.cmd [[ colorscheme nightfox ]]
  end
end

return M

