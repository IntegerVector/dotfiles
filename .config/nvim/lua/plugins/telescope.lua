return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = vim.fn.executable('make') == 1 and 'make' or 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      enabled = vim.fn.executable('make') == 1 or vim.fn.executable('cmake') == 1,
    }
  },
  config = function()
    local actions = require 'telescope.actions'
    local builtin = require('telescope.builtin')

    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        }
      },
      defaults = {
        mappings = {
          i = {
            ['C-q'] = actions.close
          },
          n = {
            ['q'] = actions.close
          }
        }
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ['<C-d>'] = 'delete_buffer',
            },
            n = {
              ['d'] = 'delete_buffer',
            }
          }
        }
      }
    }
    require('telescope').load_extension('fzf')

    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<Leader>a', function()
      builtin.buffers {
        on_complete = {
          function()
            vim.cmd [[ stopinsert ]]
          end
        }
      }
    end, opts)

    vim.keymap.set('n', '<Leader>s', function()
      builtin.git_status {
        on_complete = {
          function()
            vim.cmd [[ stopinsert ]]
          end
        }
      }
    end, opts)

    vim.keymap.set('n', '<Leader>d', builtin.find_files, opts)
    vim.keymap.set('n', '<Leader>f', builtin.live_grep, opts)

    vim.api.nvim_create_user_command('GC', builtin.git_commits, {})
    vim.api.nvim_create_user_command('GB', builtin.git_branches, {})
    vim.api.nvim_create_user_command('GS', builtin.git_stash, {})
  end
}

