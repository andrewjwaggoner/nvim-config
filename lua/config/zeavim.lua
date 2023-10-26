local zeavim = { package_name = 'KabbAmine/zeavim.vim' }
vim.keymap.set('n', '<Leader>z', '<Cmd>Zeavim<CR>', { silent = true })

function zeavim.config()
  vim.g.zv_file_types = {
    ['css'] = 'css,foundation',
    ['.htaccess'] = 'apache_http_server',
    ['\\v^(G|g)runt\\.'] = 'gulp,javascript,nodejs',
    ['\\v^(G|g)ulpfile\\.'] = 'grunt',
    ['\\v^(md|mdown|mkd|mkdn)$'] = 'markdown',
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
