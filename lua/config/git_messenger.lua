local git_messenger = {}
vim.keymap.set('n', '<Leader>gh', '<Cmd>GitMessenger<CR>', { silent = true })

function git_messenger.config()
end
function git_messenger.lazy()
  return {
    'rhysd/git-messenger.vim',
    config = git_messenger.config,
    lazy = true,
    cmd = 'GitMessenger' }
end

return git_messenger
