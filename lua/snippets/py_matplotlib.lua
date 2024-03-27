local py = {}

function py.init(ls,m)
  local t = m.t
  local i = m.i
  local c = m.c
  local d = m.d
  local s = m.s
  local sn = m.sn
  local tit = m.tit
  local newline = m.newline
  local indent = m.indent
  local recs = m.recs
  local iter = m.iter
  local rep = m.rep

  -- Quick snippets for my ipynb work
  ls.add_snippets('python', {
    s('matplotlibimport', {
      t("import matplotlib.pyplot as plt"), newline(),
      t("%matplotlib inline"),newline()
    })
  })
end

return py
