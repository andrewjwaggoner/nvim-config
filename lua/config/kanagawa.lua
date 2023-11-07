local kanagawa = { 
  package_name = "rebelot/kanagawa.nvim", 
  themes = { "kanagawa-wave", "kanagawa-dragon", "kanagawa-lotus"} }

function kanagawa.config()
  vim.g.themes = Util.merge(vim.g.themes, kanagawa.themes)
  vim.g.kanagawa_style = "kanagawa-wave"
  vim.cmd("colorscheme " .. vim.g.kanagawa_style)
end

function kanagawa.is_active_theme()
  return vim.g.kanagawa_style == vim.g.current_style
end

function kanagawa.lazy()
  return {
    kanagawa.package_name,
    name = "kanagawa",
    lazy = false,
    config = kanagawa.config,
    priority = 999,
  }
end

return kanagawa
