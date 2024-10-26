local conjure = {}
vim.keymap.set('n', '<Leader>cc', '<Cmd>Colortils picker<CR>', { silent = true })

function conjure.config()
  require('conjure').setup()
end
function conjure.lazy()
  return {
    'Olical/conjure',
    config = conjure.config,
    cmd = "Colortils",
    lazy = true }
end

return conjure
