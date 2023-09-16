local py = {}


function py.init(ls,m)
  ls.add_snippets('python', {
    m.s("def", {
      m.t("def "),
      m.i(1, "function_name"),m.t("("),m.i(2),m.t(") -> "),m.i(3, "return_type"),m.t(":"),
      m.i(0),
    }),
  })

  ls.add_snippets("python", {
    m.s("pysparklibs", {
      m.t({"from pyspark.ml.feature import StopWordsRemover, Tokenizer",
      "from pyspark.ml.feature import CountVectorizer, IDF",
      "from pyspark.ml.feature import Normalizer",
      "from pyspark.ml import Pipeline",
      "from pyspark.sql import SparkSession",
      "",
      ""}),
      m.t({"# Create a SparkSession", ""}),
      m.i(1, "spark"), m.t({" = SparkSession.builder.getOrCreate()", "", ""}),
      m.rep(1), m.t(".sparkContext.setLogLevel('"), m.c(2, { m.t("WARN"), m.t("ERROR"), m.t("INFO"), m.t("DEBUG"),}),m.t({"')", ""}),
      m.i(0),
    }),
    m.s("pysparkread", {
      m.t({"# Read a CSV file into a DataFrame",
      "df_"}), m.i(1),m.t({" = spark.read.csv(path='"}),
      m.rep(1), m.t({".csv', header=True, inferSchema=True, escape='\"')", ""}),
      m.i(0)
    }),
    m.s("barchart", {
      m.t({"import matplotlib.pyplot as "}), m.i(1), m.t({"", ""}),
    }),
  })

  end

return py

