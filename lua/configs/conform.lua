local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    rust = { "rustfmt" },
    -- cmake = { "cmake-format" },
    c_sharp = { "csharpier" },
    python = { "ruff" },
    xml = { "xmlfromatter" },
    sql = { "sqlfluff" },
  },
  -- formatters = {
  --   cmakelang = {
  --     command = vim.fn.expand "~" .. "/.local/bin/cmake-format"
  --   },
  -- },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
