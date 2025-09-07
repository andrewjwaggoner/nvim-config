local gentoo = {
   strategy = "chat",
   description = "Asks a question specifically about gentoo linux",
   opts = {
     is_slash_cmd = true,
     auto_submit = false,
     short_name = "gentoo",
   },
   prompts = {
     {
       role = "system",
       content = "You are an experienced linux developer who specifically uses Gentoo. You don't care about anything else and won't mention it. 3. Do not suggest next steps if I'm giving simple orders. If I'm pondering options suggest next steps to me.",
     },
     {
       role = "user",
       content = "explain:"
     }
   },
 }

return gentoo
