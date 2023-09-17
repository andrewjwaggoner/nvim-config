local success, ls = pcall(require, 'luasnip')
if not success then
    print("Error: luasnip could not be properly required.")
    return {}
end

local snippets = {}
snippets.c = require('snippets.c')
snippets.md = require('snippets.md')
snippets.py = require('snippets.py')
snippets.tex = require('snippets.tex')
snippets.all = require('snippets.all')

local function module()
  -- some shorthands...
  local lsm = {}
  lsm.c = ls.choice_node
  lsm.conds = require("luasnip.extras.conditions")
  lsm.conds_expand = require("luasnip.extras.conditions.expand")
  lsm.d = ls.dynamic_node
  lsm.dl = require("luasnip.extras").dynamic_lambda
  lsm.f = ls.function_node
  lsm.fmt = require("luasnip.extras.fmt").fmt
  lsm.fmta = require("luasnip.extras.fmt").fmta
  lsm.i = ls.insert_node
  lsm.l = require("luasnip.extras").lambda
  lsm.m = require("luasnip.extras").match
  lsm.n = require("luasnip.extras").nonempty
  lsm.p = require("luasnip.extras").partial
  lsm.r = ls.restore_node
  lsm.rep = require("luasnip.extras").rep
  lsm.s = ls.snippet
  lsm.sn = ls.snippet_node
  lsm.t = ls.text_node
  lsm.types = require("luasnip.util.types")
  --helpers
  lsm.newline = lsm.t({"", ""})
  lsm.indent = lsm.t({"  "})

  lsm.tit = function(idx, t1, i1, t2)
    local result = {}
    if t1 ~= nil then
        table.insert(result, lsm.t(t1))
    end
    table.insert(result, lsm.i(1, i1))
    if t2 ~= nil then
        table.insert(result, lsm.t(t2))
    end
    return lsm.sn(idx, result)
  end

  return lsm
end

snippets.c.init(ls, module())
snippets.md.init(ls, module())
snippets.py.init(ls, module())
snippets.tex.init(ls, module())

return snippets
