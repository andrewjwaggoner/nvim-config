local zeavim = { package_name = 'KabbAmine/zeavim.vim' }

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
  return { zeavim.package_name, lazy=true, config = zeavim.config }
end

return zeavim
