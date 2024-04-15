local cfg = require 'core.cfg'
local map = require 'core.map'
local cmd = require 'core.cmd'

-- Base configs:
cfg.setup()

-- Mappings:
for _, m in ipairs(map) do
  vim.api.nvim_set_keymap(m.m, m.k, m.c, m.o)
end

-- Commands:
for _, c in ipairs(cmd) do
  vim.api.nvim_create_user_command(
    c.n,
    function(opts)
      c.f(opts.args)
    end,
    c.o)
end

-- Plugins:
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require('lazy').setup('plugins')

