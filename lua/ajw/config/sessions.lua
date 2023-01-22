local sessions = {}

function sessions.config()
 require('sessions').setup( {
   session_filepath = '~/.config/nvim/.session',
   absolute = true
 })
end

return sessions
