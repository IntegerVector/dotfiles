return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },

  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    return {
      auto_brackets = {},
      completion = {
        completeopt = "menu,menuone,noinsert",
        autocomplete = false,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-n>"] = cmp.mapping.complete(),
        ["<Esc>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    local cmp = require("cmp")
    local Kind = cmp.lsp.CompletionItemKind
    cmp.setup(opts)
    cmp.event:on("confirm_done", function(event)
      if not vim.tbl_contains(opts.auto_brackets or {}, vim.bo.filetype) then
        return
      end
      local entry = event.entry
      local item = entry:get_completion_item()
      if vim.tbl_contains({ Kind.Function, Kind.Method }, item.kind) then
        local keys = vim.api.nvim_replace_termcodes("()<left>", false, false, true)
        vim.api.nvim_feedkeys(keys, "i", true)
      end
    end)
  end,
}

