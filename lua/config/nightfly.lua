local nightfly = { package_name = "bluz71/vim-nightfly-colors", themes = { "nightfly"} }

function nightfly.config()
  vim.g.themes = Util.merge(vim.g.themes, nightfly.themes)
  vim.g.nightfly_style = "nightfly"
  vim.cmd("colorscheme " .. vim.g.nightfly_style)
end

function nightfly.is_active_theme()
  return vim.g.nightfly_style == vim.g.current_style
end

function nightfly.lazy()
  return {
    nightfly.package_name,
    name = "nightfly",
    lazy = false,
    config = nightfly.config,
    priority = 1000,
  }
end

return nightfly
