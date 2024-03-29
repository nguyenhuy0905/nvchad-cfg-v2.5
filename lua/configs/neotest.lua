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
    },
    require "rustaceanvim.neotest",
  },
}

-- mapping
map("n", "<leader>tr", function()
  ntest.run.run()
end, { desc = "Neotest Run nearest test" })
map("n", "<leader>st", function()
  ntest.run.stop()
end, { desc = "Neotest Stop" })
map("n", "<leader>tr", function()
  ntest.run.attach()
end, { desc = "Neotest Attach to nearest test" })
map("n", "<leader>tw", function()
  ntest.watch.watch()
end, { desc = "Neotest Watch test results" })
