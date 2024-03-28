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
      python = "python",
      pytest_discover_instances = true,
    },
    require "neotest-java" {
      ignore_wrapper = false,
    }
  },
}
