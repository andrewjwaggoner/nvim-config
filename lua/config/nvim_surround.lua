local nvim_surround = { package_name = 'kylechui/nvim-surround' }

function nvim_surround.config()
  require('nvim-surround').setup({})
end
function nvim_surround.lazy()
  return {
    nvim_surround.package_name,
    config = nvim_surround.config,
    lazy = false }
end

return nvim_surround
