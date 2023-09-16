local c_snippets = {}

function c_snippets.init(ls,m)
  -- CUSTOM SNIPPETS
  ls.add_snippets('c', {
    m.s('main', {
      m.t({'int main(int argc, char *argv[]) {', ''}),
      m.i(0),
      m.t({'', '}', ''}),
    }),
  })
end

return c_snippets
