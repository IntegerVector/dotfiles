return {
  "echasnovski/mini.pairs",
  event = "VeryLazy",
  opts = {
    mappings = {
      ["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\].", },
      [">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\].", },
    },
  },
  keys = {
    {
      "<leader>up",
      function()
        vim.g.minipairs_disable = not vim.g.minipairs_disable
      end,
      desc = "Toggle Auto Pairs",
    },
  },
}

