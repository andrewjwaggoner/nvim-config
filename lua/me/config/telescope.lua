local telescope = {}

function telescope.config()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
    vim.cmd [[packadd popup.nvim]]
    vim.cmd [[packadd telescope-fzy-native.nvim]]
    vim.cmd [[packadd telescope-file-browser.nvim]]
  end
  require('telescope').setup {
    defaults = {
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.5 },
        vertical = { mirror = false },
      },
      initial_mode = 'insert',
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ['<C-d>'] = require('telescope.actions').delete_buffer,
          },
          n = {
            ['d'] = require('telescope.actions').delete_buffer,
          },
        }
      }
    }
  }
  require('telescope').load_extension('fzy_native')
end

return telescope
