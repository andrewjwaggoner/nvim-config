local mason_lspconfig = {}

mason_lspconfig.config = function()
  require("mason-lspconfig").setup {
      ensure_installed = {
        'awk_ls',
        'bashls',
        'clangd',
        'cmake',
        'csharp_ls',
        'cssls',
        'dockerls',
        'jsonls',
        'lua_ls',
        'pyright',
        'rust_analyzer',
        'sqlls',
        'tsserver',
        'vimls',
        'yamlls',
        'zk',
      },
  }
end

return mason_lspconfig
