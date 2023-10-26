local copilot = {}
vim.keymap.set('n', '<Leader>cd', '<Cmd>Copilot disable<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ce', '<Cmd>Copilot enable<CR>', { silent = true })
vim.keymap.set('n', '<Leader>cp', '<Cmd>Copilot panel<CR>', { silent = true })

function copilot.config()
  require('copilot').setup({})
end
function copilot.lazy()
  return {
    'github/copilot.vim' }
end

return copilot
