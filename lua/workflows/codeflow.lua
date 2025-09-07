local constants = {
  LLM_ROLE = "llm",
  USER_ROLE = "user",
  SYSTEM_ROLE = "system",
}

local fmt = string.format

local workflow = {
  strategy = "workflow",
  description = "Use a workflow to guide an LLM in writing code",
  opts = {
    index = 4,
    is_default = false,
    short_name = "cw",
  },
  prompts = {
    {
      -- We can group prompts together to make a workflow
      -- This is the first prompt in the workflow
      {
        role = constants.SYSTEM_ROLE,
        content = function(context)
          return fmt(
            "You carefully provide accurate, factual, thoughtful, nuanced answers, and are brilliant at reasoning. If you think there might not be a correct answer, you say so. Always spend a few sentences explaining background context, assumptions, and step-by-step thinking BEFORE you try to answer a question. Don't be verbose in your answers, but do provide details and examples where it might help the explanation. You are an expert software engineer for the %s language",
            context.filetype
          )
        end,
      },
      {
        role = constants.USER_ROLE,
        content = "I want you to ",
        opts = {
          auto_submit = false,
        },
      },
    },
    -- This is the second group of prompts
    {
      {
        role = constants.USER_ROLE,
        content = "Great. Now let's consider your code. I'd like you to check it carefully for correctness, style, and efficiency, and give constructive criticism for how to improve it.",
        opts = {
          auto_submit = true,
        },
      },
    },
    -- This is the final group of prompts
    {
      {
        role = constants.USER_ROLE,
        content = "Thanks. Now let's revise the code based on the feedback, without additional explanations.",
        opts = {
          auto_submit = true,
        },
      },
    },
  },
}

return workflow
