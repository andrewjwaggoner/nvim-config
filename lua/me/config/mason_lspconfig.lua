local mason_lspconfig = {}

mason_lspconfig.config = function()
  require("mason").setup {
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
        'yamlls',
        'zk'
      },
    }
  }
end

return mason_lspconfig
