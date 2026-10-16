return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },
  signs_staged_enable = true,
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 500,
      ignore_whitespace = false,
    },
    on_attach = function(buffer)
      package.loaded.gitsigns.custom_buffer = buffer
    end,
  },
}

