local py = {}

function py.init(ls)
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

  -- CUSTOM SNIPPETS
  ls.add_snippets('python', {
    s("def", {
      t("def "),
      i(1, "function_name"),t("("),i(2),t(") -> "),i(3, "return_type"),t(":"),
      i(0),
    }),
  })

  ls.add_snippets("python", {
    s("pysparklibs", {
      t({"from pyspark.ml.feature import StopWordsRemover, Tokenizer",
      "from pyspark.ml.feature import CountVectorizer, IDF",
      "from pyspark.ml.feature import Normalizer",
      "from pyspark.ml import Pipeline",
      "from pyspark.sql import SparkSession",
      "",
      ""}),
      t({"# Create a SparkSession", ""}),
      i(1, "spark"), t({" = SparkSession.builder.getOrCreate()", "", ""}),
      rep(1), t(".sparkContext.setLogLevel('"), c(2, { t("WARN"), t("ERROR"), t("INFO"), t("DEBUG"),}),t({"')", ""}),
      i(0),
    }),
    s("pysparkread", {
      t({"# Read a CSV file into a DataFrame",
      "df_"}), i(1),t({" = spark.read.csv(path='"}),
      rep(1), t({".csv', header=True, inferSchema=True, escape='\"')", ""}),
      i(0)
    }),
    s("barchart", {
      t({"import matplotlib.pyplot as "}), i(1), t({"", ""}),
    }),
  })

  end

return py

