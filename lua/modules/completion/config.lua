local config = {}

require("nvim-lsp-installer").setup {}
-- config server in this function
function config.nvim_lsp()
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

function config.nvim_cmp()
	local cmp = require("cmp")
  if (cmp) then
    cmp.setup({
      preselect = cmp.PreselectMode.Item,
      window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
      }
    })
  end
end

function config.lua_snip()
	local ls = require('luasnip')
	ls.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
	})
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load({
		paths = {'./snippets/' }
	})
end

function config.friendly_snippets()

end

return config
