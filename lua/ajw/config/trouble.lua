local trouble = {}

function trouble.config()
  require("trouble").setup {
  mode = "document_diagnostics",
  auto_close = true,
  }
end 

return trouble
