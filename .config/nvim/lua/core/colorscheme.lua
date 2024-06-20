local M = {}

M.set_light_theme = function()
  vim.cmd [[ colorscheme catppuccin-latte ]]
end

M.set_dark_theme = function()
  vim.cmd [[ colorscheme catppuccin-macchiato ]]
end

return M

