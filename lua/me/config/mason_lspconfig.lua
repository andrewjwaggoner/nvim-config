local mason_lspconfig = {}

mason_lspconfig.config = function()
  require("mason-lspconfig").setup {
      ensure_installed = {
        'awk_ls',
        'bashls',
        'clangd',
        'cmake',
        'cssls',
        'dockerls',
        'jsonls',
        'zk',
        'csharp_ls',
        'pyright',
        'rust_analyzer',
        'sqlls',
        'sumneko_lua',
        'tsserver',
        'vimls',
        'yamlls',
      },
  }
end

return mason_lspconfig
