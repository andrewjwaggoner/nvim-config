local py = {}

function py.init(ls,m)
  local t = m.t
  local i = m.i
  local c = m.c
  local s = m.s
  local newline = m.newline
  local indent = m.indent
  local rep = m.rep

  -- Quick snippets for my ipynb work
  ls.add_snippets('python', {
    s("#c", {
      t("# %%"), newline(),
    }),
    s("#cm", {
      t("# %%"), newline(),
      t("# %% [markdown]"), newline(),
    }),
    s("#mc", {
      t("# %% [markdown]"), newline(),
      t("# %%"), newline(),
    }),
    s("#m", {
      t("# %% [markdown]"), newline(),
    }),
    s("#mm", {
      t("# %% [markdown]"), newline(),
      t("# %% [markdown]"), newline(),
    })
  })

  ls.add_snippets('python', {
    s("def", {
      t("def "),
      i(1, "function_name"),t("("),i(2),t(") -> "),i(3, "return_type"),t(":"), newline(),
      indent(), i(0),
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
  })

  ls.add_snippets('python', {
    s('for', {
      t('for '), i(1, 'item'), t(' in '), i(2, 'items'), t(':'), newline(),
      indent(), i(0),
    }),
    s('fori', {
      t('for '), i(1, 'index'), t(', '), i(2, 'item'), t(' in enumerate('), i(3, 'items'), t('):'), newline(),
      indent(), i(0),
    }),
    s('forr', {
      t('for '), i(1, 'item'), t(' in range('), i(2, 'items'), t('):'), newline(),
      indent(), i(0),
    }),
    s('forri', {
      t('for '), i(1, 'index'), t(', '), i(2, 'item'), t(' in enumerate(range('), i(3, 'items'), t(')):'), newline(),
      indent(), i(0),
    }),
    s('if', {
      t('if '), i(1, 'condition'), t(':'), newline(),
      indent(), i(0),
    }),
    s('elif', {
      t('elif '), i(1, 'condition'), t(':'), newline(),
      indent(), i(0),
    }),
    s('else', {
      t('else:'), newline(),
      indent(), i(0),
    }),
    s('while', {
      t('while '), i(1, 'condition'), t(':'), newline(),
      indent(), i(0),
    }),
  })

  --dict_method_2 = {key:value for key, value in zip(keys_list, values_list)}
  ls.add_snippets('python', {
    s('zip', {
      i(1, 'dict'), t(' = {key:value for key, value in '),
      t('zip('), i(2, 'keys_list'), t(', '), i(3, 'values_list'), t(')'), newline(),
      i(0)
    }),
  })
 
  end

return py

