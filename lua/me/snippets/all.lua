local all = {}

function all.init(ls, m)
   ls.add_snippets('all', {
    m.s("d1", {
      m.t("def "),
      m.i(1, "function_name"),
      m.t("("),
      m.i(2),
      m.t(") -> "),
      m.i(3, "return_type"),
      m.t(":"),
      m.i(0),
    }),
  })

end

return all
