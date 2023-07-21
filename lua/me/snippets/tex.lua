local tex = {}

function tex.init(ls)
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

  -- HELPER METHODS
  local rec_ls
  rec_ls = function()
    return sn(
      nil,
      c(1, {
        -- Order is important, sn(...) first would cause infinite loop of expansion.
        t(""),
        sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
      })
    )
  end

  -- CUSTOM SNIPPETS
  ls.add_snippets("tex", {
    s("ls", {
      t({ "\\begin{itemize}", "\t\\item " }),
      i(1),
      d(2, rec_ls, {}),
      t({ "", "\\end{itemize}" }),
    }),
  }, {
    key = "tex",
  })
end

return tex
