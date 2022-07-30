local config = {}

function config.nvim_lsp()
  require('nvim-lsp-installer').setup {}
  require 'lspconfig'.sumneko_lua.setup {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        }
      }
    }
  }
  require 'lspconfig'.html.setup {}
  require 'lspconfig'.csharp_ls.setup {}
  require 'lspconfig'.marksman.setup {}
  require 'lspconfig'.pyright.setup {}
  require 'lspconfig'.eslint.setup {}
end

return config
