local completion_config = require('modules.completion.config')

-- custom commands for easy casing functions
vim.api.nvim_create_user_command('TitleCase', function()
  vim.cmd('s/\\<./\\u&/g')
  vim.cmd('noh')
end, {
  nargs = '*',
  desc = 'Change line to have title casing',
})

vim.api.nvim_create_user_command('LowerCase', function()
  vim.cmd('s/\\<.*/\\L&/g')
  vim.cmd('noh')
end, {
  nargs = '*',
  desc = 'Change line to have lower casing',
})

vim.api.nvim_create_user_command('UpperCase', function()
  vim.cmd('s/\\<.*/\\U&/g')
  vim.cmd('noh')
end, {
  nargs = '*',
  desc = 'Change line to have upper casing',
})

vim.api.nvim_create_user_command('AutoCmpOn', function()
  completion_config.nvim_cmp(true)
end, {
  nargs = '*',
  desc = 'Enable autocompletion while we\'re typing',
})

vim.api.nvim_create_user_command('AutoCmpOff', function()
  completion_config.nvim_cmp()
end, {
  nargs = '*',
  desc = 'Disable autocompletion while we\'re typing',
})
-- enable automatic completion popup on typing
--vim.cmd('command AutoCmpOn lua setAutoCmp(true)')

-- disable automatic competion popup on typing
--vim.cmd('command AutoCmpOff lua setAutoCmp(false)')
