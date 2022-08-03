local config = {}

function config.nvim_lsp()
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local lua_settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false }
    },
    capabilities = capabilities
  }

  require "lsp_signature".setup { bind = true, handler_opts = { border = "rounded" } }
  require('nvim-lsp-installer').setup {}

  require 'lspconfig'.html.setup { capabilities = capabilities }
  require 'lspconfig'.csharp_ls.setup { capabilities = capabilities }
  require 'lspconfig'.marksman.setup { capabilities = capabilities }
  require 'lspconfig'.pyright.setup { capabilities = capabilities }
  require 'lspconfig'.eslint.setup { capabilities = capabilities }
  require 'lspconfig'.sumneko_lua.setup { settings = lua_settings }
end

return config

-- NOTE:
-- OmniSharp has issues on Mac M1, it references dotnet 3.1.26 which isn't built
-- for.
--  require 'lspconfig'.omnisharp.setup {
--    use_mono = true,
--    cmd = {
--      '~/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp', '--languageserver', '--hostPID', tostring(vim.fn.getpid()) },
--    capabilities = capabilities,
--  }
