local md = {}

function md.init(ls, m)

  -- Helper methods to construct markdown items
  local chart_node = function(idx, name)
    return m.sn(idx, {
      m.i(1, name),
      m.c(2, {
        m.sn(nil, m.tit(1, '(', 'rounded_square', ')')),
        m.sn(nil, m.tit(1, '((', 'circle', '))')),
        m.sn(nil, m.tit(1, '([', 'rounded', '])')),
        m.sn(nil, m.tit(1, '>', 'asym_circle', ']')),
        m.sn(nil, m.tit(1, '[', 'square', ']')),
        m.sn(nil, m.tit(1, '[((', 'cylinder', '))]')),
        m.sn(nil, m.tit(1, '[/', 'parallel', '/]')),
        m.sn(nil, m.tit(1, '[/', 'trapezoid', '\\]')),
        m.sn(nil, m.tit(1, '[[', 'double_rect', ']]')),
        m.sn(nil, m.tit(1, '{', 'rhombus', '}')),
        m.sn(nil, m.tit(1, '{{', 'hexagon', '}}'))
      })
    })
  end

  local chart_op = function(idx)
    return m.c(idx, {
      m.sn(nil, m.tit(1, '--', 'text', '---')),
      m.sn(nil, m.tit(1, '--->|', 'text', '|')),
      m.sn(nil, m.tit(1, '-.', 'text', '.->')),
      m.sn(nil, m.tit(1, '==', 'text', '==>')),
      m.t(' & '),
      m.t('---'),
      m.t('-->'),
      m.t('-.-'),
      m.t('-.->'),
      m.t('<-->'),
      m.t('==>'),
      m.t('o--o'),
      m.t('x--x'),
    })
  end

  local chart_direction = function(idx)
    return m.c(idx, {
      m.t('LR'), m.t('TD'), m.t('BT'), m.t('RL')
    })
  end

  local click_type = function(idx)
    return m.c(idx, {m.t(' href '), m.t(' call '), m.t(' callback '), m.t(' ')})
  end

  -- CUSTOM SNIPPETS
  ls.add_snippets('markdown', {
    m.s({trig = "link", desc = "HTML link"}, m.tit(1, "[", "link text", "](2)")),
    m.s({trig = "image", desc = "HTML image"}, m.tit(1, "![", "image text", "](2)")),
    m.s({trig = "code", desc = "HTML code"}, m.tit(1, "`", "code")),
    m.s({trig = "bold", desc = "bold"}, m.tit(1, "**", "text", "**")),
    m.s({trig = "italic", desc = "italic"}, m.tit(1, "*", "text", "*")),
    m.s({trig = "strike", desc = "strike"}, m.tit(1, "~~", "text", "~~")),
    m.s({trig = "quote", desc = "quote"}, m.tit(1, "> ", "quote")),
    m.s({trig = "ul", desc = "ul"}, m.tit(1, "- ", "item")),
    m.s({trig = "ol", desc = "ol"}, m.tit(1, "1. ", "item")),
    m.s({trig = "hr", desc = "hr"}, m.t("---")),
    m.s({trig = "head", desc = "header"}, m.tit(1, "# ", "header")),
    m.s({trig = "script", desc = "JS script"}, m.tit(1, "<script>", '', "</script>")),
  })

  ls.add_snippets('markdown', {
    m.s("flowchart", {
      m.t({"```mermaid", ''}),
      m.t("graph "), chart_direction(1), m.newline,
      m.indent, chart_node(2, 'A'), chart_op(3), chart_node(4, 'B'), m.newline,
      m.t({"```", ''}),
    }),
  })

  ls.add_snippets('markdown', {
    m.s("click", {
      m.tit(1, 'click ', 'A'), click_type(2), m.tit(3, nil, 'https://', ' _blank'),
    }),
  })

  ls.add_snippets('markdown', {
    m.s("css", {
      m.tit(1, "style ", "A", " "),
      m.tit(2, "fill:#", "fac", ","),
      m.tit(3, "stroke:#", "ddd", ","),
      m.tit(4, "stroke-width:2", "px"),
    })
  })

end

return md
