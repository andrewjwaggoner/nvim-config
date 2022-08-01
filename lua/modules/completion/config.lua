local config = {}

function config.nvim_cmp()
  local cmp = require('cmp')
  if (cmp) then
    cmp.setup({
      completion = {
        autocomplete = true,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      flags = {
        debounce_text_changes = 100,
      },
      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'cmdline' },
      },
    })
  end
end

function config.lua_snip()
  require('luasnip').config.set_config({
    history = true,
    updateevents = 'TextChanged,TextChangedI',
  })
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' }
  })
end

function config.friendly_snippets()

end

return config
