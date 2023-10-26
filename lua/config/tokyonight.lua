local tokyonight = { package_name = 'folke/tokyonight.nvim' }

function tokyonight.config()
  vim.cmd('colorscheme tokyonight')
end
function tokyonight.lazy()
  return {tokyonight.package_name, config = tokyonight.config, lazy = false, priority = 1000 }
end

return tokyonight
