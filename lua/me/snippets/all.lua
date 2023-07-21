local all = {}

-- CUSTOM SNIPPETS

function all.init(ls)
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

  -- set type to "autosnippets" for adding autotriggered snippets.
  ls.add_snippets("all", {
    s("autotrigger", {
      t("autosnippet"),
    }),
  }, {
    type = "autosnippets",
    key = "all_auto",
  })

end

return all
