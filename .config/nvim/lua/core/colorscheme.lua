local M = {}

M.set_light_theme = function()
  vim.cmd [[ colorscheme dawnfox ]]
end

M.set_dark_theme = function()
  vim.cmd [[ colorscheme nightfox ]]
end

return M

