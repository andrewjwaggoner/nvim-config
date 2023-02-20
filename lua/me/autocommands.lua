-- custom commands for easy casing functions
vim.api.nvim_create_user_command('TitleCase', function()
  vim.cmd('s/\\<./\\u&/g')
  vim.cmd('noh')
end, {
  nargs = 0,
  desc = 'Change line to have title casing',
})

vim.api.nvim_create_user_command('LowerCase', function()
  vim.cmd('s/\\<.*/\\L&/g')
  vim.cmd('noh')
end, {
  nargs = 0,
  desc = 'Change line to have lower casing',
})

vim.api.nvim_create_user_command('UpperCase', function()
  vim.cmd('s/\\<.*/\\U&/g')
  vim.cmd('noh')
end, {
  nargs = 0,
  desc = 'Change line to have upper casing',
})

vim.api.nvim_create_user_command('GitCommit', function()
  vim.cmd('Git commit -a')
end, {
  nargs = 0,
  desc = 'Change line to have upper casing',
})

vim.api.nvim_create_user_command('JupyterSync', function(table)
  vim.cmd('!python -m jupyter_ascending.scripts.make_pair --base ' .. table.args)
end, {
  nargs = 1,
  desc = 'Sync jupyter notebook with python file',
})

vim.api.nvim_create_user_command('JupyterLaunch', function()
  vim.cmd('!jupyter notebook ' .. vim.fn.bufname() .. ' &> /dev/null &')
  print("Use # %% to separate cells, # %% [markdown] for markdown cells")
end, {
  nargs = 0,
  desc = 'Launch jupyter notebook of current buffer',
})

vim.api.nvim_create_user_command('JupyterKill', function()
  vim.cmd('!kill $(pgrep -f jupyter)')
end, {
  nargs = 0,
  desc = 'Kill all jupyter notebooks',
})
