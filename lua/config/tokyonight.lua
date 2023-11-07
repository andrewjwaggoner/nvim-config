local tokyonight = { package_name = 'folke/tokyonight.nvim', themes = { 'tokyonight-storm', 'tokyonight-moon', 'tokyonight-night', 'tokyonight-day' }}

function tokyonight.config()
  require('tokyonight').setup {}
  print('working')

  vim.g.themes = Util.merge(vim.g.themes, tokyonight.themes)
  vim.g.tokyonight_style = 'tokyonight-moon'
  vim.cmd('colorscheme ' .. vim.g.tokyonight_style)
end

function tokyonight.is_active_theme()
  return vim.g.tokyonight_style == vim.g.current_style
end

function tokyonight.lazy()
  return {
    tokyonight.package_name, 
    config = tokyonight.config, 
    lazy = false, 
    disable = true,
    priority = 1000 }
end

return tokyonight
