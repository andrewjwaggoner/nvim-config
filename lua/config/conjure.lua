local conjure = {}

vim.keymap.set('n', '<LocalLeader>ee', '<Cmd>ConjureEval<CR>', { silent = true })
vim.keymap.set('n', '<LocalLeader>cc', '<Cmd>ConjureConnect<CR>', { silent = true })

function conjure.config()
end

function conjure.lazy()
  return {
    'Olical/conjure',
    ft = { "clojure", "fennel", "racket", "lisp" },
    config = conjure.config,
    dependencies = {
      --'PaterJason/cmp-conjure'
    },
    lazy = true }
end

return conjure
