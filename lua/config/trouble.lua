local trouble = {}
vim.keymap.set('n', '<Leader>r', '<Cmd>Trouble diagnostics toggle<CR>', { silent = true })
vim.keymap.set('n', '<Leader>rs', '<Cmd>Trouble symbols toggle<CR>', { silent = true })

function trouble.config()
  require("trouble").setup {
  mode = "document_diagnostics",
  auto_close = true,
  }
end
function trouble.lazy()
  return {
    'folke/trouble.nvim',
    lazy = true,
    dependencies = 'kyazdani42/nvim-web-devicons',
    cmd="Trouble",
    config = trouble.config }
end

return trouble
