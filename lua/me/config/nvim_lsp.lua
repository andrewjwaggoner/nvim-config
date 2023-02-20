local nvim_lsp = {}

nvim_lsp.config = function()
  require 'lspconfig'.lua_ls.setup {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false }
      }
    }
  }

  require 'lspconfig'.awk_ls.setup {}
  require 'lspconfig'.bashls.setup {}
  require 'lspconfig'.clangd.setup {}
  require 'lspconfig'.cmake.setup {}
  require 'lspconfig'.cssls.setup {}
  require 'lspconfig'.dockerls.setup {}
  require 'lspconfig'.jsonls.setup {}
  require 'lspconfig'.zk.setup {}
  require 'lspconfig'.csharp_ls.setup {}
  require 'lspconfig'.pyright.setup {}
  require 'lspconfig'.sqlls.setup {}
  require 'lspconfig'.rust_analyzer.setup {}
  require 'lspconfig'.tsserver.setup {}
  require 'lspconfig'.vimls.setup {}
  require 'lspconfig'.yamlls.setup {}

end

return nvim_lsp
