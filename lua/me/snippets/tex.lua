local tex = {}

function tex.init(ls, m)
  -- HELPER METHODS
  local rec_ls
  rec_ls = function()
    return m.sn(
      nil,
      m.c(1, {
        -- Order is important, sn(...) first would cause infinite loop of expansion.
        m.t(""),
        m.sn(nil, { m.t({ "", "\t\\item " }), m.i(1), m.d(2, rec_ls, {}) }),
      })
    )
  end

  -- CUSTOM SNIPPETS
  ls.add_snippets("tex", {
    m.s("ls", {
      m.t({ "\\begin{itemize}", "\t\\item " }),
      m.i(1),
      m.d(2, rec_ls, {}),
      m.t({ "", "\\end{itemize}" }),
    }),
  }, {
    key = "tex",
  })
end

return tex
