local conjure = {}

vim.keymap.set('n', '<LocalLeader>ee', '<Cmd>ConjureEval<CR>', { silent = true })
vim.keymap.set('n', '<LocalLeader>cc', '<Cmd>ConjureConnect<CR>', { silent = true })
vim.api.nvim_echo({{"Consider setting up cmp for Conjure, and in general", "Normal"}}, false, {})

function conjure.config()
end

function conjure.lazy()
  return {
    'Olical/conjure',
    config = conjure.config,
    lazy = false }
end

return conjure
