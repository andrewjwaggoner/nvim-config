local dadbod = {}

vim.keymap.set('n', '<Leader>dt', '<Cmd>DBUIToggle<CR>', { silent = true })

function dadbod.config()
  vim.g.db_ui_use_nerd_fonts = 1
end

function dadbod.lazy()
  return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    config = dadbod.config,
  }
end

return dadbod
