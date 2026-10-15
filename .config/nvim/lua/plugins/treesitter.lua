return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup()

    local parsers = {
      'bash',
      'xml',
      'html',
      'css',
      'scss',
      'javascript',
      'typescript',
      'angular',
      'vue',
      'markdown',
      'json',
      'yaml',
      'toml',
      'csv',
      'sql',
      'vimdoc',
      'vim',
      'lua',
      'python',
      'rust',
      'c',
      'cpp',
    }

    require('nvim-treesitter').install(parsers)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = parsers,
      callback = function(args)
        vim.treesitter.start(args.buf)
      end,
    })
  end,
}

