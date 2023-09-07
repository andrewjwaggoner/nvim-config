local snippets = {}
local ls

local success, luasnip = pcall(require, 'luasnip')
if success then
    ls = luasnip
else
    print("Error: luasnip could not be properly required.")
    return snippets
end

snippets.c = require('me.snippets.c')
snippets.md = require('me.snippets.md')
snippets.py = require('me.snippets.py')
snippets.tex = require('me.snippets.tex')
snippets.all = require('me.snippets.all')

snippets.c.init(ls)
snippets.md.init(ls)
snippets.py.init(ls)
snippets.tex.init(ls)

return snippets

