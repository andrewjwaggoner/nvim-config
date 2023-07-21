local py = {}

function py.init(ls)
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

  -- CUSTOM SNIPPETS
  --
end

return py
