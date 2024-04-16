return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = 'if_many',
        prefix = '●',
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
      'lua_ls',
      'rust_analyzer',
      'tsserver',
      'yamlls',
      'lemminx',
      'html',
      'cssmodules_ls',
      'somesass_ls',
      'jsonls',
      'dockerls'
    }

    local setup = function(server)
      require('lspconfig')[server].setup({})
    end

    require('mason').setup()
    require('mason-lspconfig').setup()

    require('mason-lspconfig').setup {
      ensure_installed,
      handlers = { setup }
    }

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
  end
}

