local ls = require("luasnip")
local snippets = require("me.snippets")

-- some shorthands...
local c = ls.choice_node
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")
local d = ls.dynamic_node
local dl = require("luasnip.extras").dynamic_lambda
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local i = ls.insert_node
local l = require("luasnip.extras").lambda
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local p = require("luasnip.extras").partial
local r = ls.restore_node
local rep = require("luasnip.extras").rep
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local types = require("luasnip.util.types")

ls.setup({
  history = true,
  update_events = "TextChanged,TextChangedI",
  delete_check_events = "TextChanged",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "choiceNode", "Comment" } },
      },
    },
  },
  ext_base_prio = 300,
  ext_prio_increase = 1,
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
  ft_func = function()
    return vim.split(vim.bo.filetype, ".", true)
  end,
})

snippets.all.init(ls)
snippets.c.init(ls)
snippets.py.init(ls)
snippets.tex.init(ls)

 ls.add_snippets('all', {
    s("d1", {
      t("def "),
      i(1, "function_name"),
      t("("),
      i(2),
      t(") -> "),
      i(3, "return_type"),
      t(":"),
      i(0),
    }),
  })


ls.filetype_set("cpp", { "c" }) -- in a cpp file: search c-snippets, then all-snippets only (no cpp-snippets!!).
require("luasnip.loaders.from_lua").load({ include = { "c" } })
require("luasnip.loaders.from_lua").lazy_load({ include = { "all", "cpp" } })

local luasnip = {}
function luasnip.config() end
return luasnip

