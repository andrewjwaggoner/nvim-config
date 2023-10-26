local git_messenger = {}

function git_messenger.config()
end

function git_messenger.lazy()
  return {
    'rhysd/git-messenger.vim',
    config = git_messenger.config,
    lazy = true,
  }
end

return git_messenger
