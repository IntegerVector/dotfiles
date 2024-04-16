local u = require 'core.utils'

local M = {}

M.setup = function()
  vim.cmd("autocmd!")

  vim.g.mapleader = ' '

  vim.scriptencoding = 'utf-8'
  vim.opt.encoding = 'utf-8'
  vim.opt.fileencoding = 'utf-8'  

  vim.opt.title = true
  vim.opt.number = true
  vim.opt.showcmd = true
  vim.opt.hlsearch = true
  vim.opt.undofile = true
  vim.opt.swapfile = true
  vim.opt.smarttab = true
  vim.opt.expandtab = true
  vim.opt.incsearch = true
  vim.opt.showmatch = true
  vim.opt.smartcase = true
  vim.opt.ignorecase = true
  vim.opt.autoindent = true
  vim.opt.cursorline = true
  vim.opt.splitright = true
  vim.opt.splitbelow = true
  vim.opt.smartindent = true
  vim.opt.breakindent = true
  vim.opt.termguicolors = true

  vim.opt.wrap = false
  vim.opt.backup = false
  vim.opt.undofile = false

  vim.opt.cmdheight = 1
  vim.opt.laststatus = 2
  vim.opt.numberwidth = 4
  vim.opt.timeoutlen = 400

  vim.opt.mouse = 'a'
  vim.opt.wildoptions = 'pum'
  vim.opt.wildmode = 'longest'

  vim.opt.path:append { '**' }
  vim.opt.formatoptions:append { 'r' }
  vim.opt.clipboard:append  { 'unnamedplus' }
  vim.opt.shortmess:append { s = true, I = true }
  vim.opt.wildignore:append { '*/node_modules/*' }
  vim.opt.backspace = { 'indent', 'eol', 'start' }
  vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }

  u.set_file_format('unix')
  u.set_tab_size(2)

  if vim.fn.has('macunix') == 1 then
    vim.opt.clipboard:append { 'unnamed' }
  end
  if vim.fn.has('unix') == 1 then
    vim.opt.clipboard:append { 'unnamedplus' }
  end
  if vim.fn.has('win32') == 1 then
    vim.opt.clipboard = 'unnamed'
  end
end

return M

