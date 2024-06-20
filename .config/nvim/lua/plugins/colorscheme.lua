return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      cmp = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      mason = true,
      markdown = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      neotree = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
    },
  },
  config = function()
    require("catppuccin").setup {
      color_overrides = {
        latte = {
          mantle = "#EFF1F6",
        },
      }
    }

    -- catppuccin, catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    vim.cmd [[ colorscheme catppuccin-macchiato ]]
  end
}

