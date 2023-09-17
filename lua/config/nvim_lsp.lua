local nvim_lsp = {}

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

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

  require 'lspconfig'.bashls.setup { on_attach = on_attach }
  require 'lspconfig'.clangd.setup { on_attach = on_attach }
  require 'lspconfig'.cssls.setup { on_attach = on_attach }
  require 'lspconfig'.dockerls.setup { on_attach = on_attach }
  require 'lspconfig'.jsonls.setup { on_attach = on_attach }
  require 'lspconfig'.omnisharp.setup { on_attach = on_attach }
  require 'lspconfig'.pyright.setup { on_attach = on_attach }
  require 'lspconfig'.rust_analyzer.setup { on_attach = on_attach }
  require 'lspconfig'.sqlls.setup { on_attach = on_attach }
  require 'lspconfig'.tsserver.setup { on_attach = on_attach }
  require 'lspconfig'.vimls.setup { on_attach = on_attach }
  require 'lspconfig'.yamlls.setup { on_attach = on_attach }
  require 'lspconfig'.zk.setup { on_attach = on_attach }

end

return nvim_lsp
