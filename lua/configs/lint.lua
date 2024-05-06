local lint = require "lint"

lint.linters_by_ft = {
  text = { "codespell" },
  python = { "ruff" },
  -- c = { "clangtidy" },
  -- cpp = { "clangtidy" },
  c_sharp = { "csharpier" },
  -- markdown = { "vale" },
  -- cmake = { "checkmake" },
  -- make = {"checkmake"},
}

-- lint.linters.checkmake = {
--   cmd = vim.fn.expand "~" .. "/.local/share/nvim/mason/packages/checkmake/checkmake-0.2.2.linux.amd64",
--   args = {vim.fn.getcwd(), "/Makefile"}
-- }
