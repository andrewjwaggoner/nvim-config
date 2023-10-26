local snippets = {}
snippets.config = function()
  snippets.snippets = require("snippets")
end

snippets.lazy = function()
  return {
    'L3MON4D3/LuaSnip' ,
    config = snippets.config,
    lazy = false
  }
end

return snippets
