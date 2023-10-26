local copilot = {}

function copilot.config()
  require('copilot').setup({})
end

function copilot.lazy()
  return {
    'github/copilot.vim'}
end

return copilot
