return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false,
  deactivate = function()
    vim.cmd('Neotree close')
  end,

  init = function()
    local group = vim.api.nvim_create_augroup('NeoTreeStartDirectory', {
      clear = true,
    })

    vim.api.nvim_create_autocmd('BufEnter', {
      group = group,
      once = true,
      desc = 'Open Neo-tree when Neovim starts with a directory',
      callback = function()
        if package.loaded['neo-tree'] then
          return
        end

        local arg = vim.fn.argv(0)
        if arg == '' then
          return
        end

        local stat = vim.uv.fs_stat(arg)
        if stat and stat.type == 'directory' then
          require('neo-tree')
        end
      end,
    })
  end,

  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },

    open_files_do_not_replace_types = {
      'terminal',
      'Trouble',
      'trouble',
      'qf',
      'Outline',
    },

    filesystem = {
      bind_to_cwd = false,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      use_libuv_file_watcher = true,
    },

    window = {
      position = 'left',
      width = 50,
      mappings = {
        ['s'] = 'none',
        ['w'] = 'none',
        ['<space>'] = 'none',
        ['Y'] = {
          function(state)
            local node = state.tree:get_node()
            if node then
              vim.fn.setreg('+', node:get_id(), 'c')
            end
          end,
          desc = 'Copy path to clipboard',
        },

        ['O'] = {
          function(state)
            local node = state.tree:get_node()
            if node and node.path then
              require('lazy.util').open(node.path, { system = true })
            end
          end,
          desc = 'Open with system application',
        },

        ['gA'] = 'git_add_all',
        ['gu'] = 'git_unstage_file',
        ['ga'] = 'git_add_file',
        ['gr'] = 'git_revert_file',
        ['gc'] = 'git_commit',
        ['gp'] = 'git_push',
        ['sv'] = 'open_vsplit',
      },
    },

    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },

      git_status = {
        symbols = {
          added = '',
          modified = '',
          deleted = '',
          renamed = '',
          ignored = '',
          untracked = '',
          unstaged = '',
          staged = '',
          conflict = '',
        },
      },
    },
  },
}

