local snippets = {}
local ls = require('luasnip')

snippets.c = require('me.snippets.c')
snippets.all = require('me.snippets.all')
snippets.py = require('me.snippets.py')
snippets.tex = require('me.snippets.tex')

snippets.c.init(ls)
snippets.all.init(ls)
snippets.py.init(ls)
snippets.tex.init(ls)

return snippets
