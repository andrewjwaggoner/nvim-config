local sessions = {}

function sessions.config()
 require('sessions').setup( {
   session_filepath = '~/.config/nvim/.session',
   absolute = true
 })
end

function sessions.lazy()
 return {
   'natecraddock/sessions.nvim',
   config = sessions.config,
   lazy = true,
   cmd = {'SessionsSave', 'SessionsLoad'}
 }
end
return sessions
