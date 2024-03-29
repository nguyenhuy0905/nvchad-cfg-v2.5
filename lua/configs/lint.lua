local lint = require "lint"

lint.linters_by_ft = {
  text = { "codespell" },
  python = { "ruff" },
  c = { "clangtidy" },
  cpp = { "clangtidy" },
  c_sharp = { "csharpier" },
  markdown = { "vale" },
  cmake = { "checkmake" },
}

