local mason_lspconfig = {}

mason_lspconfig.config = function()
  require("mason").setup {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  }
  require("mason-lspconfig").setup {
    ensure_installed = {
      'bashls',
      'clangd',
      'cssls',
      'dockerls',
      'jsonls',
      'omnisharp',
      'pyright',
      'rust_analyzer',
      'sqlls',
      'tsserver',
      'vimls',
      'yamlls'
    },
  }

end

return mason_lspconfig
