local config = {}

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
    paths = { './snippets/' }
  })
end

function config.friendly_snippets()

end

return config
