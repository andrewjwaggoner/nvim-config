local zeavim = {}

function zeavim.config()
  vim.g.zv_file_types = {
    ['css'] = 'css,foundation',
    ['.htaccess'] = 'apache_http_server',
    ['\\v^(G|g)runt\\.'] = 'gulp,javascript,nodejs',
    ['\\v^(G|g)ulpfile\\.'] = 'grunt',
    ['\\v^(md|mdown|mkd|mkdn)$'] = 'markdown',
}
end

return zeavim
