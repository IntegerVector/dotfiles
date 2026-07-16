local M = {}

local mappings = {
  require('mappings.text-increment-numbers'),
  require('mappings.text-decrement-numbers'),
  require('mappings.text-paste-from-zero-buffer'),
  require('mappings.text-select-all'),
  require('mappings.window-split-horizontal'),
  require('mappings.window-split-vertical'),
  require('mappings.window-switch-down'),
  require('mappings.window-switch-up'),
  require('mappings.window-switch-left'),
  require('mappings.window-switch-right'),
  require('mappings.window-resize-down'),
  require('mappings.window-resize-up'),
  require('mappings.window-resize-left'),
  require('mappings.window-resize-right'),
  require('mappings.text-clear-highlight'),
  require('mappings.spell-enable'),
  require('mappings.spell-disable'),
  require('mappings.file-save-all'),
  require('mappings.file-save-and-quit'),
  require('mappings.tab-create'),
  require('mappings.tab-switch-next'),
  require('mappings.tab-switch-prev'),
  require('mappings.tab-move-right'),
  require('mappings.tab-move-left'),
  require('mappings.plugins-manager-open'),
  require('mappings.terminal-create'),
  require('mappings.terminal-exit-mode'),
  require('mappings.buffer-switch-next'),
  require('mappings.buffer-switch-prev'),
  require('mappings.file-tree-toggle'),
}

M.setup = function()
  for _, module in ipairs(mappings) do
    for _, mode in ipairs(module.modes) do
      vim.api.nvim_set_keymap(mode, module.key, module.action, module.options)
    end
  end
end

return M

