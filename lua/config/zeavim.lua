local zeavim = { package_name = 'KabbAmine/zeavim.vim' }
vim.keymap.set('n', '<Leader>z', '<Cmd>Zeavim<CR>', { silent = true })
vim.keymap.set('n', '<Leader><Leader>z', '<Plug>ZVKeyDocset', { silent = true })
vim.keymap.set('n', 'gz', '<Plug>ZVOperator', { silent = true })
vim.keymap.set('v', '<Leader>z', '<Plug>ZVVisSelection', { silent = true })

function zeavim.config()
  vim.g.zv_file_types = {
    ['.htaccess'] = 'apache_http_server',
    ['\\v^(G|g)runt\\.'] = 'gulp,javascript,nodejs',
    ['\\v^(G|g)ulpfile\\.'] = 'grunt',
    ['\\v^(md|mdown|mkd|mkdn)$'] = 'markdown',
    ['\\v^Dockerfile$'] = 'docker',
    ['\\v^Gemfile$'] = 'ruby',
    ['\\v^Rakefile$'] = 'ruby',
    ['\\v^Rakefile$'] = 'ruby',
    ['\\v^docker-compose'] = 'docker_compose',
    ['\\v^makefile$'] = 'make',
    ['css'] = 'css,foundation',
    ['help'] = 'vim',
    ['vim'] = 'vim',
  }
end
function zeavim.lazy()
  return { 
    zeavim.package_name, 
    lazy = true, 
    cmd = 'Zeavim',
    config = zeavim.config }
end

return zeavim
