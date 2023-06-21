local mason_lspconfig = {}

mason_lspconfig.config = function()
  require("mason-lspconfig").setup {
      ensure_installed = {
        'bashls',
        'cssls',
        'csharp_ls',
        'dockerls',
        'jsonls',
        'pyright',
        'rust_analyzer',
        'tsserver',
        'vimls',
        'yamlls',
      },
  }
end

return mason_lspconfig
