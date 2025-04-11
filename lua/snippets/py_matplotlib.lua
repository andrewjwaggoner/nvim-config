local py = {}

function py.init(ls,m)
  local t = m.t
  local s = m.s
  local newline = m.newline

  -- Quick snippets for my ipynb work
  ls.add_snippets('python', {
    s('matplotlibimport', {
      t("import matplotlib.pyplot as plt"), newline(),
      t("%matplotlib inline"),newline()
    })
  })
end

return py
