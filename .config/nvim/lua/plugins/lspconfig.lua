return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      severity_sort = true,
    },
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
  },
  config = function(_, opts)
    local ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "tsserver",
      "yamlls",
      "lemminx",
      "html",
      "cssmodules_ls",
      "somesass_ls",
      "jsonls",
      "dockerls"
    }

    local setup = function(server)
      require("lspconfig")[server].setup({})
    end

    require("mason").setup()
    require("mason-lspconfig").setup()

    require("mason-lspconfig").setup {
      ensure_installed,
      handlers = { setup }
    }

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    local o = { noremap = true, silent = true }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, o)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, o)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, o)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, o)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, o)
    vim.keymap.set({ "n", "v" }, "<Leader>c", vim.lsp.buf.code_action, o)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
    vim.keymap.set("n", "<Leader>v", vim.diagnostic.open_float, o)
    -- vim.keymap.set("n", "<Leader>F", function()
    --  vim.lsp.buf.format { async = true }
    -- end, opts)
  end
}

