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
  require('telescope').load_extension('luasnip')
end

function telescope.lazy()
return { 'nvim-telescope/telescope.nvim', lazy = true, cmd = 'Telescope', config = telescope.config, dependencies = {
       { 'nvim-telescope/telescope-file-browser.nvim' },
       { 'nvim-lua/plenary.nvim'},
       { 'nvim-lua/popup.nvim'},
       { "benfowler/telescope-luasnip.nvim"},
       { 'nvim-telescope/telescope-fzy-native.nvim'}}}
end

return telescope
