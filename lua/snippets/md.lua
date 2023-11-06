local md = {}

function md.init(ls, m)
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

  -- Helper methods to construct markdown items
  local chart_node = function(idx, name)
    return sn(idx, {
      i(1, name),
      c(2, {
        sn(nil, tit(1, '(', 'rounded_square', ')')),
        sn(nil, tit(1, '((', 'circle', '))')),
        sn(nil, tit(1, '([', 'rounded', '])')),
        sn(nil, tit(1, '>', 'asym_circle', ']')),
        sn(nil, tit(1, '[', 'square', ']')),
        sn(nil, tit(1, '[(', 'cylinder', ')]')),
        sn(nil, tit(1, '[/', 'parallel', '/]')),
        sn(nil, tit(1, '[/', 'trapezoid', '\\]')),
        sn(nil, tit(1, '[[', 'double_rect', ']]')),
        sn(nil, tit(1, '{', 'rhombus', '}')),
        sn(nil, tit(1, '{{', 'hexagon', '}}'))
      })
    })
  end

  local chart_op = function(idx)
    return c(idx, {
      sn(nil, tit(1, '--', 'text', '---')),
      sn(nil, tit(1, '--->|', 'text', '|')),
      sn(nil, tit(1, '-.', 'text', '.->')),
      sn(nil, tit(1, '==', 'text', '==>')),
      t(' & '),
      t('---'),
      t('-->'),
      t('-.-'),
      t('-.->'),
      t('<-->'),
      t('==>'),
      t('o--o'),
      t('x--x')
    })
  end

  local chart_direction = function(idx)
    return c(idx, {
      t('LR'), t('TD'), t('BT'), t('RL')
    })
  end

  local click_type = function(idx)
    return c(idx, {t(' href '), t(' call '), t(' callback '), t(' ')})
  end

  local function list_item()
      return {
        t("\t\\item "),
        i(1, "text"),
        t({""})
      }
  end

  ls.add_snippets("markdown", {
  -- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
  -- \item as necessary by utilizing a choiceNode.
      s("ls", {
    t({ "\\begin{itemize}", ""}),
    d(1, recs(list_item), {}, {}),
    t({"", "\\end{itemize}", ""}),
  }),
})

  -- CUSTOM SNIPPETS
  ls.add_snippets('markdown', {
    s({trig = "link", desc = "HTML link"}, { tit(1, "[", "link text", "]"), tit(2, "(", "url", ")")}),
    s({trig = "image", desc = "HTML image"}, { tit(1, "![", "image text", "]"), tit(2, "(", "url", ")")}),
    s({trig = "code", desc = "HTML code"}, tit(1, "`", "code")),
    s({trig = "bold", desc = "bold"}, tit(1, "**", "text", "**")),
    s({trig = "italic", desc = "italic"}, tit(1, "*", "text", "*")),
    s({trig = "strike", desc = "strike"}, tit(1, "~~", "text", "~~")),
    s({trig = "quote", desc = "quote"}, tit(1, "> ", "quote", nil)),
    s({trig = "ul", desc = "ul"}, {d(1, rec_ls, {}, {user_args = {} }) }),
    s({trig = "ol", desc = "ol"}, tit(1, "1. ", "item", nil)),
    s({trig = "hr", desc = "hr"}, t("---")),
    s({trig = "head", desc = "header"}, tit(1, "# ", "header", nil)),
    s({trig = "script", desc = "JS script"}, tit(1, "<script>", '', "</script>")),
  })

  ls.add_snippets('markdown', {
    s("click", {
      tit(1, 'click ', 'A'), click_type(2), tit(3, nil, 'https://', ' _blank'),
    }),
  })

  ls.add_snippets('markdown', {
    s("css", {
      tit(1, "style ", "A", " "),
      tit(2, "fill:#", "fac", ","),
      tit(3, "stroke:#", "ddd", ","),
      tit(4, "stroke-width:2", "px"),
    })
  })

  ls.add_snippets('markdown', {
    s("flowchart", {
      t({"```mermaid", ''}),
       t("graph "), chart_direction(1), newline(), 
       indent(), 
       chart_node(2, 'A'), 
       chart_op(3), 
       chart_node(4, 'B'), 
       newline(),
       t({"```", ''}),
    }),
  })

  ls.add_snippets('markdown', {
    s("journey", {
      t({"```mermaid", ''}),
      t("journey"), newline(),
      indent(), tit(1, "title ", "text"), newline(),
      indent(), tit(2, "section ", "text"), newline(),
      sn(3, {
        indent(),
        tit(1, nil, "what", ": "),
        tit(2, nil, "score", ": "),
        i(3,"who"),
        newline()}),
      t({"```", ''}),
    })
  })

end

return md
