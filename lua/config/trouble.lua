local trouble = {}

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
    cmd="TroubleToggle",
    config = trouble.config }
end

return trouble
