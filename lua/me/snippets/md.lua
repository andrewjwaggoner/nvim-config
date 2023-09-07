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

    ls.add_snippets('markdown', {
      s("flowchart", {
        t("```mermaid\n"),
        t("graph LR\n"),
        t("    A[Square Rect] -- Link text --> B((Circle))\n"),
        t("    A --> C(Round Rect)\n"),
        t("    B --> D{Rhombus}\n"),
        t("    C --> D\n"),
        t("```\n"),
    }),
  })

end

return md
