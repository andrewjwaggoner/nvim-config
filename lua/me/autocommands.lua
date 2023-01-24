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

vim.api.nvim_create_user_command('GitCommit', function()
  vim.cmd('Git commit -a')
end, {
  nargs = '*',
  desc = 'Change line to have upper casing',
})

