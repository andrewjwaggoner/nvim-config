local all = {}

function all.init(ls, m)
   ls.add_snippets('all', {
    m.s({trig = "date",  desc = 'today\'s date'}, m.date_input()),
    m.s({trig = "time",  desc = 'current time'}, m.time_input()),
  })
end

return all
