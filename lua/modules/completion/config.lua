local config = {}

function config.nvim_cmp(enable_autocomplete)
  local cmp = require('cmp')
  local autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged }
  local cmp_mapping = {
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<C-Space>'] = cmp.mapping.complete({}),
    ['<CR>'] = cmp.mapping.confirm(),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item()),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item()),
    ['<C-J>'] = cmp.mapping.scroll_docs(-4),
    ['<C-K>'] = cmp.mapping.scroll_docs(4),
  }

  local snippets = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  }

  local sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'cmdline' },
  }

  if (cmp) then
    if enable_autocomplete == true then
      cmp.setup({
        completion = { autocomplete = autocomplete },
        mapping = cmp_mapping,
        snippet = snippets,
        sources = sources,
      })
    else
      cmp.setup({
        completion = { autocomplete = false },
        mapping = cmp_mapping,
        snippet = snippets,
        sources = sources,
      })
    end

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
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
