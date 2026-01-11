local success, ls = pcall(require, 'luasnip')
if not success then
    print('Error: luasnip could not be properly required.')
    return {}
end

local snippets = {}
snippets.c = require('snippets.c')
snippets.md = require('snippets.md')
snippets.py = require('snippets.py')
snippets.py_matplotlib = require('snippets.py_matplotlib')
snippets.sql = require('snippets.sql')
snippets.tex = require('snippets.tex')
snippets.all = require('snippets.all')

local function module()
  -- some shorthands...
  local lsm = {}
  lsm.c = ls.choice_node
  lsm.conds = require('luasnip.extras.conditions')
  lsm.conds_expand = require('luasnip.extras.conditions.expand')
  lsm.d = ls.dynamic_node
  lsm.dl = require('luasnip.extras').dynamic_lambda
  lsm.f = ls.function_node
  lsm.fmt = require('luasnip.extras.fmt').fmt
  lsm.fmta = require('luasnip.extras.fmt').fmta
  lsm.i = ls.insert_node
  lsm.l = require('luasnip.extras').lambda
  lsm.m = require('luasnip.extras').match
  lsm.n = require('luasnip.extras').nonempty
  lsm.p = require('luasnip.extras').partial
  lsm.r = ls.restore_node
  lsm.rep = require('luasnip.extras').rep
  lsm.s = ls.snippet
  lsm.sn = ls.snippet_node
  lsm.t = ls.text_node
  lsm.types = require('luasnip.util.types')

  --helpers
  lsm.newline = function() return lsm.t({'', ''}) end
  lsm.indent = function() return lsm.t('  ') end
  -- combination of t,i,t nodes
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

  -- current strategy is to do a restoreNode on our snippet_fn(), indexed with level
  lsm.recs = function(snippet_fn, level)
    level = (level or 0)

    local function recs_fn()
      return lsm.sn(nil, {
        lsm.sn(nil, {
          unpack(snippet_fn())
        }),
        lsm.c(1, {
          lsm.t(''),
          lsm.sn(nil, {
            lsm.newline(),
            lsm.d(1, lsm.recs(snippet_fn, level+1))})
        })
      })
    end
    return recs_fn
  end

  lsm.iter = function(idx,snip_name, _)
    return lsm.c((idx or 1), {
      lsm.t(''),
      lsm.tit(1, snip_name, lsm.t('')),
    })
  end

  -- time functions for snippets
  lsm.date_input = function(_, _, _, fmt)
    fmt = fmt or '%Y-%m-%d'
    return lsm.sn(nil, lsm.i(1, os.date(fmt)))
  end

  lsm.time_input = function(_,_,_)
    return lsm.sn(nil, lsm.i(1, tostring(os.time())))
  end

  -- use this object when wiring up snippets
  return lsm
end

local m = module()
ls.snippets = {}
snippets.c.init(ls, m)
snippets.md.init(ls, m)
snippets.py.init(ls, m)
snippets.py_matplotlib.init(ls, m)
snippets.sql.init(ls, m)
snippets.tex.init(ls, m)
snippets.all.init(ls, m)

return snippets
