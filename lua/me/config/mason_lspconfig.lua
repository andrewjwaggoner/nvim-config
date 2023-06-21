local mason_lspconfig = {}

mason_lspconfig.config = function()
  require("mason-lspconfig").setup {
      ensure_installed = {
      },
  }
end

return mason_lspconfig
