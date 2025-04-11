local gp = {}

function gp.config()
  local conf = {
     openai_api_key = os.getenv("OPENAI_API_KEY"),
  }
  require("gp").setup(conf)
end

function gp.lazy()
  return {
    'https://github.com/Robitx/gp.nvim',
    config = gp.config,
    lazy = false }
end

return gp

