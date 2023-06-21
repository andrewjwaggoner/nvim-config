local telescope = {}

local function on_attach(bufnr)
  local api = require('telescope.actions')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', 'dd', api.delete_buffer, opts('Delete Buffer'))
  vim.keymap.set('i', '<C-d>', api.delete_buffer, opts('Delete Buffer'))
end

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
    on_attach=on_attach,
  }
  require('telescope').load_extension('fzy_native')
end

return telescope
