local map = require 'core.map'
local cmd = require 'core.cmd'

for _, m in ipairs(map) do
  vim.api.nvim_set_keymap(m.m, m.k, m.c, m.o)
end

for _, c in ipairs(cmd) do
  vim.api.nvim_create_user_command(
    c.n,
    function(opts)
      c.f(opts.args)
    end,
    c.o)
end

