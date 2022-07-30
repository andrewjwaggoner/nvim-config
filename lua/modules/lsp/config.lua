local config = {}

-- config server in this function
function config.nvim_lsp()
  require("nvim-lsp-installer").setup {}
  require'lspconfig'.sumneko_lua.setup{
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
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
  --Enable (broadcasting) snippet capability for completion
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  require'lspconfig'.html.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.csharp_ls.setup{}
  require'lspconfig'.marksman.setup{}

end

return config
