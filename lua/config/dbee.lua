local dbee = {}

vim.keymap.set('n', '<Leader>xs', function() require('dbee').open() end, { silent = true })

function dbee.config()
  require('dbee').setup({
  })
end

function dbee.install()
  require("dbee").install()
end

function dbee.lazy()
  return {
    "kndndrj/nvim-dbee",
    dependencies = { "MunifTanjim/nui.nvim" },
    build = dbee.install,
    config = dbee.config,
    lazy = true
  }
end

return dbee
