local lint = require "lint"

lint.linters_by_ft = {
  text = { "codespell" },
  python = { "ruff" },
  c = { "clangtidy" },
  cpp = { "clangtidy" },
  c_sharp = { "csharpier" },
  markdown = { "markdownlint-cli2", "vale" },
  -- cmake = { "checkmake" },
  -- make = {"checkmake"},
}

-- lint.linters.checkmake = {
--   cmd = vim.fn.expand "~" .. "/.local/share/nvim/mason/packages/checkmake/checkmake-0.2.2.linux.amd64",
--   args = {vim.fn.getcwd(), "/Makefile"}
-- }
-- lint.linters.vale = {
--   cmd = vim.fn.expand "~" .. "/.local/share/nvim/mason/packages/vale/vale",
--   args = { vim.fn.expand "%" },
-- }

-- local clang_tidy_pattern = [[([^:]*):(%d+):(%d+): (%w+): ([^[]+)]]
-- local clang_tidy_groups = { "file", "lnum", "col", "severity", "message" }
--
-- local clang_tidy_severity_map = {
--   ["error"] = vim.diagnostic.severity.ERROR,
--   ["warning"] = vim.diagnostic.severity.WARN,
--   ["information"] = vim.diagnostic.severity.INFO,
--   ["hint"] = vim.diagnostic.severity.HINT,
--   ["note"] = vim.diagnostic.severity.HINT,
-- }
-- lint.linters.clangtidy = {
--   cmd = "clang-tidy",
--   stdin = false,
--   args = { "--quiet", "-checks=-clang-analyzer-*,google-*,portability-*,readability-*,performance-*" },
--   ignore_exitcode = true,
--   perser = require("lint.parser").from_pattern(
--     clang_tidy_pattern,
--     clang_tidy_groups,
--     clang_tidy_severity_map,
--     { ["source"] = "clang-tidy" }
--   ),
-- }
