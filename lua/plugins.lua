local settings = require('config')

local allowed = {
  cabline = true,
  colortils = true,
  conjure = true,
  copilot = true,
  dadbod = true,
  dbee = true,
  diffview = true,
  fugitive = true,
  git_messenger = true,
  glsl_extract = true,
  gp = true,
  indent_blankline = true,
  init = true,
  jupyter_ascending = true,
  kanagawa = true,
  lualine = true,
  markdown_preview = true,
  mason = true,
  nightfly = true,
  nvim_colorizer = true,
  nvim_dap = true,
  nvim_lsp = true,
  nvim_surround = true,
  nvim_tree = true,
  oil = true,
  rainbow_delimiters = true,
  sessions = true,
  snippets = true,
  telescope = true,
  tokyonight = true,
  treesitter = true,
  trouble = true
}

local modules = {}

-- Iterate through the properties of the settings table
---@param moduleConfig {lazy: fun(): any}
for moduleName, moduleConfig in pairs(settings) do
  if allowed[moduleName] and moduleConfig and type(moduleConfig == "table") and type(moduleConfig.lazy) == "function" then
    table.insert(modules, moduleConfig.lazy())
  end
end

require('lazy').setup(modules)
