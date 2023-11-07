local catppuccin = { package_name = 'catppuccin/nvim', themes = { 'catppuccin-latte', 'catppuccin-frappe', 'catppuccin-macchiato', 'catppuccin-mocha' } }

function catppuccin.config()
  require('catppuccin').setup {}

  --vim.g.themes = {unpack(vim.g.themes), unpack(catppuccin.themes)}
  vim.g.catppuccin_style = 'catppuccin-macchiato'
  vim.cmd('colorscheme ' .. vim.g.catppuccin_style)
end

function catppuccin.is_active_theme()
  return vim.g.catppuccin_style == vim.g.current_style
end

function catppuccin.lazy()
  return {
    catppuccin.package_name, 
    name = 'catppuccin',
    config = catppuccin.config, 
    lazy = false, 
    priority = 1000 }
end

return catppuccin
