return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = vim.fn.executable("make") == 1 and "make" or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      enabled = vim.fn.executable("make") == 1 or vim.fn.executable("cmake") == 1,
    }
  },
  config = function()
    local actions = require "telescope.actions"
    local builtin = require("telescope.builtin")
    local fb_actions = require("telescope._extensions.file_browser.actions")

    require("telescope").setup {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        file_browser = {
          initial_mode = "normal",
          theme="ivy",
          hijack_netrw = false,
          select_buffer = true,
          path = "%:p:h",
          display_stat = { date = false, size = true, mode = false },
          mappings = {
            ["i"] = {
              ["<C-a>"] = fb_actions.create,
              ["<S-CR>"] = fb_actions.create_from_prompt,
              ["<A-r>"] = fb_actions.rename,
              ["<A-m>"] = fb_actions.move,
              ["<A-c>"] = fb_actions.copy,
              ["<A-d>"] = fb_actions.remove,
              ["<C-g>"] = fb_actions.goto_parent_dir,
              ["<C-e>"] = fb_actions.goto_home_dir,
              ["<C-w>"] = fb_actions.goto_cwd,
              ["<C-t>"] = fb_actions.change_cwd,
              ["<C-f>"] = fb_actions.toggle_browser,
              ["<C-h>"] = fb_actions.toggle_hidden,
              ["<C-s>"] = fb_actions.toggle_all,
            },
            ["n"] = {
              ["a"] = fb_actions.create,
              ["r"] = fb_actions.rename,
              ["m"] = fb_actions.move,
              ["c"] = fb_actions.copy,
              ["d"] = fb_actions.remove,
              ["g"] = fb_actions.goto_parent_dir,
              ["e"] = fb_actions.goto_home_dir,
              ["w"] = fb_actions.goto_cwd,
              ["t"] = fb_actions.change_cwd,
              ["f"] = fb_actions.toggle_browser,
              ["H"] = fb_actions.toggle_hidden,
              ["s"] = fb_actions.toggle_all,
            },
          },
        },
      },
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.5,
          },
          vertical = {
            prompt_position = "bottom",
            preview_height = 0.6,
          },
        },
        mappings = {
          i = {
            ["C-q"] = actions.close
          },
          n = {
            ["q"] = actions.close
          }
        }
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<C-d>"] = "delete_buffer",
            },
            n = {
              ["d"] = "delete_buffer",
            }
          }
        }
      }
    }
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")

    local fb_launch = require("telescope").extensions.file_browser.file_browser

    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<Leader>a", function()
      builtin.buffers {
        on_complete = {
          function()
            vim.cmd [[ stopinsert ]]
          end
        }
      }
    end, opts)

    vim.keymap.set("n", "<Leader>s", function()
      builtin.git_status {
        on_complete = {
          function()
            vim.cmd [[ stopinsert ]]
          end
        }
      }
    end, opts)

    vim.keymap.set("n", "<space>r", function()
	    fb_launch()
    end, opts)


    vim.keymap.set("n", "<Leader>d", builtin.find_files, opts)
    vim.keymap.set("n", "<Leader>f", builtin.live_grep, opts)

    vim.api.nvim_create_user_command("GC", builtin.git_commits, {})
    vim.api.nvim_create_user_command("GB", builtin.git_branches, {})
    vim.api.nvim_create_user_command("GS", builtin.git_stash, {})
  end
}

