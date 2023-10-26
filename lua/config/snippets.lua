local snippets = {}
vim.keymap.set('n', '<Leader><Leader>s', '<Cmd>source ~/.config/nvim/lua/me/config/snippets.lua<CR>', { silent = true })
vim.keymap.set("i", "<C-K>", function() require("luasnip").expand_or_jump() end, {silent = true})
vim.keymap.set("i", "<C-H>", function() require("luasnip").jump(-1) end, {silent = true})
vim.keymap.set("i", "<C-L>", function() require("luasnip").jump( 1) end, {silent = true})
vim.keymap.set("i", "<C-E>", function() if require("luasnip").choice_active() then require('luasnip').change_choice(1) end end, {silent = true})
vim.keymap.set("s", "<C-K>", function() require("luasnip").expand() end, {silent = true})
vim.keymap.set("s", "<C-H>", function() require("luasnip").jump(-1) end, {silent = true})
vim.keymap.set("s", "<C-L>", function() require("luasnip").jump( 1) end, {silent = true})
vim.keymap.set("s", "<C-E>", function() if require("luasnip").choice_active() then require('luasnip').change_choice(1) end end, {silent = true})

snippets.config = function()
  snippets.snippets = require("snippets")
end
snippets.lazy = function()
  return {
    'L3MON4D3/LuaSnip',
    config = snippets.config,
    lazy = false }
end

return snippets
