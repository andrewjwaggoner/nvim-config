local all = {}

function all.init(ls, m)
   ls.add_snippets('all', {
    m.s({trig = "date",  desc = 'today\'s date'}, m.date_input()),
  })
end

return all
