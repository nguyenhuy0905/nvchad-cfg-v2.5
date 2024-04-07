local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    -- cmake = { "cmake-format" },
    c_sharp = { "csharpier" },
    python = { "ruff" },
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
