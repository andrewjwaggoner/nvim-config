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

  local function rec_ls(_,_,_,level)
     if level == nil then
       level = 2
     end

      if level > 10 then
        return m.sn(nil, m.t(""))
      end

      return m.sn(nil, {
        m.c(1, {
          m.sn(nil, {
            m.t("\t\\item "),
            m.i(1, "text"),
            m.t({"",""}) }),
          m.sn(nil, {
            m.tit(1,"\t\\item ", "text", nil), m.newline,
            m.d(2, rec_ls, {}, {user_args = {level+1} })}),
        })
      })
  end

ls.add_snippets("markdown", {
	-- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
	-- \item as necessary by utilizing a choiceNode.
	m.s("ls", {
		m.t({ "\\begin{itemize}", ""}),
		m.d(1, rec_ls, {}),
		m.t({ "\\end{itemize}", ""}),
	}),
})

  -- CUSTOM SNIPPETS
  ls.add_snippets('markdown', {
    m.s({trig = "link", desc = "HTML link"}, { m.tit(1, "[", "link text", "]"), m.tit(2, "(", "url", ")")}),
    m.s({trig = "image", desc = "HTML image"}, { m.tit(1, "![", "image text", "]"), m.tit(2, "(", "url", ")")}),
    m.s({trig = "code", desc = "HTML code"}, m.tit(1, "`", "code")),
    m.s({trig = "bold", desc = "bold"}, m.tit(1, "**", "text", "**")),
    m.s({trig = "italic", desc = "italic"}, m.tit(1, "*", "text", "*")),
    m.s({trig = "strike", desc = "strike"}, m.tit(1, "~~", "text", "~~")),
    m.s({trig = "quote", desc = "quote"}, m.tit(1, "> ", "quote", nil)),
    m.s({trig = "ul", desc = "ul"}, {m.d(1, rec_ls, {}, {user_args = {} }) }),
    m.s({trig = "ol", desc = "ol"}, m.tit(1, "1. ", "item", nil)),
    m.s({trig = "hr", desc = "hr"}, m.t("---")),
    m.s({trig = "head", desc = "header"}, m.tit(1, "# ", "header", nil)),
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

  ls.add_snippets('markdown', {
    m.s("journey", {
      m.t({"```mermaid", ''}),
      m.t("journey"), m.newline,
      m.indent, m.tit(1, "title ", "text"), m.newline,
      m.indent, m.tit(2, "section ", "text"), m.newline,
      m.sn(3, {
        m.indent,
        m.tit(1, nil, "what", ": "),
        m.tit(2, nil, "score", ": "),
        m.i(3,"who"),
        m.newline,}),
      m.t({"```", ''}),
    })
  })

end

return md
