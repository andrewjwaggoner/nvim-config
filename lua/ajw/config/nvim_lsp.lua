local nvim_lsp = {}

nvim_lsp.config = function()
  require 'lspconfig'.sumneko_lua.setup {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false }
      }
    }
  }
end

return nvim_lsp
