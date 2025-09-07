local automate = {
    strategy = "chat",
    description = "tries to automate some workflow in Neovim",
    opts = {
      is_slash_cmd = true,
      auto_submit = false,
      short_name = "auto",
    },
    prompts = {
      {
        role = "system",
        content = "You are helping the user to make code changes in Neovim. You will be updating the user's buffer with the @{insert_edit_into_file} tool. You don't care about anything else and won't mention it.",
      },
      {
        role = "user",
        content = "You will be updating my buffer #{buffer} with the @{insert_edit_into_file} tool."
      }
    },
  }

return automate
