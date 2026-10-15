return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {},
    },
    {
      'mason-org/mason-lspconfig.nvim',
      opts = {
        ensure_installed = { 'ts_ls', 'vue_ls' },
        automatic_enable = false,
      },
    },
  },

  config = function()
    local vue_language_server =
        vim.fn.stdpath('data')
        .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'

    vim.lsp.config('ts_ls', {
      filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
        'vue',
      },
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = vue_language_server,
            languages = { 'vue' },
          },
        },
      },
    })

    vim.lsp.config('vue_ls', {})
    vim.lsp.enable({ 'ts_ls', 'vue_ls' })
  end,
}

