local telescope = {}
vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>', { silent = true })
vim.keymap.set('n', '<Leader>fl', '<Cmd>Telescope resume<CR>', { silent = true })
vim.keymap.set('n', '<Leader>fo', '<Cmd>Telescope oldfiles<CR>', { silent = true })
vim.keymap.set('n', '<Leader>fp', '<Cmd>Telescope spell_suggest<CR>', { silent = true })
vim.keymap.set('n', '<Leader>fr', '<Cmd>Telescope registers<CR>', { silent = true })
vim.keymap.set('n', '<Leader>fs', '<Cmd>Telescope luasnip<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ft', '<Cmd>Telescope treesitter<CR>', { silent = true })
vim.keymap.set('n', '<Leader>gc', '<Cmd>Telescope git_commits<CR>', { silent = true })
vim.keymap.set('n', '<Leader>gd', '<Cmd>Telescope git_status<CR>', { silent = true })
vim.keymap.set('n', '<Leader>gf', '<Cmd>Telescope git_bcommits<CR>', { silent = true })
vim.keymap.set('n', '<Leader>gr', '<Cmd>Telescope git_branches<CR>', { silent = true })
vim.keymap.set('n', '<Leader>gt', '<Cmd>Telescope git_stash<CR>', { silent = true })

local function on_attach(bufnr)
  local api = require('telescope.actions')
  vim.keymap.set('n', 'dd', api.delete_buffer, opts('Delete Buffer'))
  vim.keymap.set('i', '<C-d>', api.delete_buffer, opts('Delete Buffer'))

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
end
function telescope.config()
  require('telescope').setup {
    defaults = {
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.5 },
        vertical = { mirror = false },
      },
      initial_mode = 'normal',
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
  return { 
    'nvim-telescope/telescope.nvim', 
    lazy = true, 
    cmd = 'Telescope', 
    config = telescope.config, 
    dependencies = {
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-lua/plenary.nvim'},
      { 'nvim-lua/popup.nvim'},
      { "benfowler/telescope-luasnip.nvim"},
      { 'nvim-telescope/telescope-fzy-native.nvim'}}}
end

return telescope
