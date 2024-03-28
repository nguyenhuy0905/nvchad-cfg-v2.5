local lint = require "lint"

lint.linters_by_ft = {
  python = { "pylint" },
  c = { "cppcheck" },
  cpp = { "cppcheck" },
}
