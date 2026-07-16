local M = {}

local plugins = {
  require('plugins.neo-tree'),
  require('plugins.telescope'),
  require('plugins.telescope-file-browser'),
  require('plugins.lua-line'),
  require('plugins.snip'),
  require('plugins.lspconfig'),
  require('plugins.formating'),
  require('plugins.lint'),
  require('plugins.cmp'),
  require('plugins.gitsigns'),
  require('plugins.mini-pair'),
  require('plugins.indent-blankline'),
  require('plugins.colorscheme'),
}

M.setup = function()
  local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
    })
  end

  vim.opt.rtp:prepend(lazypath)
  require('lazy').setup(plugins)
end

return M

