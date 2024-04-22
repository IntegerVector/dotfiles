local default_options = { noremap = true, silent = true, expr = false }

return {
  { name = "n", key = "+", command = "<C-a>", options = default_options },
  { name = "n", key = "_", command = "<C-x>", options = default_options },
  { name = "n", key = "<Leader>p", command = '"0p', options = default_options },
  { name = "v", key = "<Leader>p", command = '"0p', options = default_options },
  { name = "n", key = "<C-a>", command = "gg<S-v>G", options = default_options },
  { name = "n", key = "st", command = ":tabedit<Return>", options = default_options },
  { name = "n", key = "sh", command = ":split<Return>", options = default_options },
  { name = "n", key = "sv", command = ":vsplit<Return>", options = default_options },
  { name = "n", key = "<Leader>j", command = "<C-w>j", options = default_options },
  { name = "n", key = "<Leader>k", command = "<C-w>k", options = default_options },
  { name = "n", key = "<Leader>h", command = "<C-w>h", options = default_options },
  { name = "n", key = "<Leader>l", command = "<C-w>l", options = default_options },
  { name = "n", key = "<Leader><left>", command = "20<C-w><", options = default_options },
  { name = "n", key = "<Leader><right>", command = "20<C-w>>", options = default_options },
  { name = "n", key = "<Leader><up>", command = "5<C-w>+", options = default_options },
  { name = "n", key = "<Leader><down>", command = "5<C-w>-", options = default_options },
  { name = "n", key = "<Esc>", command = ":noh<Return>", options = default_options },
  { name = "n", key = "<Leader>z", command = ":set spell<Return>", options = default_options },
  { name = "n", key = "<Leader>Z", command = ":set nospell<Return>", options = default_options },
  { name = "n", key = "<Leader>w", command = ":wa<Return>", options = default_options },
  { name = "n", key = "<Leader>q", command = ":wq<Return>", options = default_options },
  { name = "n", key = "<Leader>[", command = "gT", options = default_options },
  { name = "n", key = "<Leader>]", command = "gt", options = default_options },
  { name = "n", key = "<Leader>.", command = ":tabm +1<Return>", options = default_options },
  { name = "n", key = "<Leader>,", command = ":tabm -1<Return>", options = default_options },
  { name = "n", key = "<Leader>/", command = ":Lazy<Return>", options = default_options },
  { name = "n", key = "<Leader>t", command = ":term<Return>", options = default_options },
  { name = "t", key = "<Esc>", command = "<C-\\><C-n>", options = default_options },
}
