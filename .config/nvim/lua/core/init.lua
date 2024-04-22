local nvim_config = require "core.nvim_config"
local mappings = require "core.mappings"
local commands = require "core.commands"

-- Base configs:
nvim_config.setup()

-- Mappings:
for _, m in ipairs(mappings) do
  vim.api.nvim_set_keymap(m.name, m.key, m.command, m.options)
end

-- Commands:
for _, c in ipairs(commands) do
  vim.api.nvim_create_user_command(
    c.name,
    function(opts)
      c.command(opts.args)
    end,
    c.options)
end

-- Plugins:
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

