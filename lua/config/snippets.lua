local snippets = {}
vim.keymap.set('n', '<Leader><Leader>s', '<Cmd>source ' .. vim.fn.stdpath('config') .. '/lua/snippets/init.lua<CR>', { silent = true })
vim.keymap.set("i", "<C-k>", function() require("luasnip").expand_or_jump() end, {silent = true})
vim.keymap.set("i", "<C-h>", function() require("luasnip").jump(-1) end, {silent = true})
vim.keymap.set("i", "<C-l>", function() require("luasnip").jump( 1) end, {silent = true})
vim.keymap.set("i", "<C-e>", function() if require("luasnip").choice_active() then require('luasnip').change_choice(1) end end, {silent = true})
vim.keymap.set("s", "<C-k>", function() require("luasnip").expand() end, {silent = true})
vim.keymap.set("s", "<C-h>", function() require("luasnip").jump(-1) end, {silent = true})
vim.keymap.set("s", "<C-l>", function() require("luasnip").jump( 1) end, {silent = true})
vim.keymap.set("s", "<C-e>", function() if require("luasnip").choice_active() then require('luasnip').change_choice(1) end end, {silent = true})

snippets.config = function()
  snippets.snippets = require("snippets")
end
snippets.lazy = function()
  return {
    'L3MON4D3/LuaSnip',
    event = "InsertEnter",
    config = snippets.config }
end

return snippets
