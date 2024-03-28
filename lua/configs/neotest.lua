local ntest = require "neotest"

ntest.setup {
  adapters = {
    require "neotest-haskell" {
      build_tools = { "stack", "cabal" },
      frameworks = { "tasty", "hspec", "sydtest" },
    },
    require "neotest-dotnet" {
      dap = {
        args = { justMyCode = false },
        adapter_name = "coreclr",
      },
      discovery_root = "solution",
    },
    require "neotest-python" {
      dap = { justMyCode = false },
      args = { "--log-level", "DEBUG" },
      runner = "pytest",
      python = ".venv/bin/python",
      pytest_descover_instances = true,
    },
  },
}
