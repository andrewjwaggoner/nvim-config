local md = {}

function md.init(ls)
  -- some shorthands...
  local c = ls.choice_node
  local conds = require("luasnip.extras.conditions")
  local conds_expand = require("luasnip.extras.conditions.expand")
  local d = ls.dynamic_node
  local dl = require("luasnip.extras").dynamic_lambda
  local f = ls.function_node
  local fmt = require("luasnip.extras.fmt").fmt
  local fmta = require("luasnip.extras.fmt").fmta
  local i = ls.insert_node
  local l = require("luasnip.extras").lambda
  local m = require("luasnip.extras").match
  local n = require("luasnip.extras").nonempty
  local p = require("luasnip.extras").partial
  local r = ls.restore_node
  local rep = require("luasnip.extras").rep
  local s = ls.snippet
  local sn = ls.snippet_node
  local t = ls.text_node
  local types = require("luasnip.util.types")
  local newline = t({"", ""})
  local indent = t({"    "})

  ls.add_snippets('markdown', {
    s({trig="link", dscr="HTML link"}, {
      t("["), i(1, "link text"), t("]("), i(2, "link url"), t(")"),
    })})

    ls.add_snippets('markdown', {
      s({trig="image", dscr="HTML image"}, {
        t("!["), i(1, "image text"), t("]("), i(2, "image url"), t(")"),
    })})

    ls.add_snippets('markdown', {
      s({trig="code", dscr="HTML code"}, {
        t("`"), i(1, "code"), t("`"),
    })})

    ls.add_snippets('markdown', {
      s({trig="bold", dscr="bold"}, {
        t("**"), i(1, "text"), t("**"),
    })})

    ls.add_snippets('markdown', {
      s("italic", { t("*"), i(1, "text"), t("*"),
    })})

    ls.add_snippets('markdown', {
      s("strike", { t("~~"), i(1, "text"), t("~~"),
    })})

    ls.add_snippets('markdown', {
      s("quote", {
        t("> "), i(1, "quote"),
    })})

    ls.add_snippets('markdown', {
      s("ul", {
        t("- "), i(1, "item"),
    })})

    ls.add_snippets('markdown', {
      s("ol", {
        t("1. "), i(1, "item"),
    })})

    ls.add_snippets('markdown', {
      s("hr", {
        t("---"),
    })})

    ls.add_snippets('markdown', {
      s("head", {
        t("# "), i(1, "header"),
    })})

    local chart_node = function(idx, default_name)
      if not default_name then
        default_name = 'A'
      end
      return c(idx, {
        sn(nil, { i(1, default_name), t('('), i(2, 'rounded_square'), t(')') }),
        sn(nil, { i(1, default_name), t('(('), i(2, 'circle'), t('))') }),
        sn(nil, { i(1, default_name), t('((('), i(2, 'double_circle'), t(')))') }),
        sn(nil, { i(1, default_name), t('(['), i(2, 'rounded'), t('])') }),
        sn(nil, { i(1, default_name), t('[/'), i(2, 'parallel'), t('/]') }),
        sn(nil, { i(1, default_name), t('[/'), i(2, 'trapezoid'), t('\\]') }),
        sn(nil, { i(1, default_name), t('>'), i(2, 'asymmetric_circle'), t(']') }),
        sn(nil, { i(1, default_name), t('['), i(2, 'square'), t(']') }),
        sn(nil, { i(1, default_name), t('[('), i(2, 'cylinder'), t(')]') }),
        sn(nil, { i(1, default_name), t('[['), i(2, 'double_rect'), t(']]') }),
        sn(nil, { i(1, default_name), t('{'), i(2, 'rhombus'), t('}') }),
        sn(nil, { i(1, default_name), t('{{'), i(2, 'hexagon'), t('}}') }),
      })
    end

    local chart_op = function(idx)
      return c(idx, {
        sn(nil, { t('-- '), i(1, 'text'), t(' ---')}),
        sn(nil, { t('--->|'), i(1, 'text'), t('|')}),
        sn(nil, { t('-. '), i(1, 'text'), t(' .->')}),
        sn(nil, { t('== '), i(1, 'text'), t(' ==>')}),
        t(' & '),
        t(' --- '),
        t('-->'),
        t('-.- '),
        t('-.-> '),
        t('<-->'),
        t('==>'),
        t('o--o'),
        t('x--x'),
      })
    end

    local chart_direction = function(idx)
      return c(idx, {
        t('LR'), t('TD'), t('BT'), t('RL')
      })
    end

    ls.add_snippets('markdown', {
      s("flowchart", {
        t({"```mermaid", ''}),
        t("graph "), chart_direction(1), newline,
        indent(), chart_node(2, 'A'), chart_op(3), chart_node(4, 'B'), newline,
        t({"```", ''}),
      }),
    })

    ls.add_snippets('markdown', {
      s("click", {
        t('click '), i(1, 'A'), c(2, {t(' href '), t(' call '), t(' callback '), t(' ')}, i(3, 'https://')),
      }),
    })

end

return md
