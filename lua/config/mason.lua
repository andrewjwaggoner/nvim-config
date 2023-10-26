local mason = {}

mason.config = function()
    require("mason").setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
end
mason.lspconfig = function()
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
      'marksman',
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
mason.lazy = function()
  return { 
    'williamboman/mason-lspconfig.nvim', 
    cmd = "Mason", 
    lazy = true, 
    config = mason.lspconfig, 
    dependencies = {
      { 'williamboman/mason.nvim', lazy = true, config = mason.config}
    }
  }
end

return mason
