---@diagnostic disable: redundant-parameter
local dap = require "dap"

-- C/C++/CrabLang
-- dap.adapters.gdb = {
--   type = "executable",
--   command = "gdb",
--   args = {"-i", "dap"}
-- }

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "/home/huynguyen/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
    args = { "--port", "${port}" },
  },
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
-- Haskell
dap.adapters.haskell = {
  type = "executable",
  command = "haskell-debug-adapter",
  args = { "--hackage-version=0.0.33.0" },
}
dap.configurations.haskell = {
  {
    type = "haskell",
    request = "launch",
    name = "Debug",
    workspace = "${workspaceFolder}",
    startup = "${file}",
    logFile = vim.fn.stdpath "data" .. "/haskell-dap.log",
    logLevel = "WARNING",
    ghciEnv = vim.empty_dict(),
    ghciPrompt = "λ: ",
    ghciInitialPrompt = "λ: ",
    ghciCmd = "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
  },
}
-- dotnet in general
dap.adapters.coreclr = {
  type = "executable",
  command = "/home/huynguyen/.local/share/nvim/mason/packages/netcoredbg/netcoredbg",
  args = { "--interpreter=vscode" },
}
dap.configurations.cs = {
  {
    type = "coreclr",
    request = "launch",
    name = "Launch - netcoredbg",
    program = function()
      return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
    end,
  },
}
-- mappings
local map = vim.keymap.set
map("n", "<F5>", function()
  dap.continue()
end, { desc = "DAP Continue debug" })
map("n", "<F10>", function()
  dap.step_over()
end, { desc = "DAP Step over a function" })
map("n", "<F11>", function()
  dap.step_into()
end, { desc = "DAP Step into a function" })
map("n", "<F12>", function()
  dap.step_out()
end, { desc = "DAP Step out of a function" })
map("n", "<leader>tb", function()
  dap.toggle_breakpoint()
end, { desc = "DAP Toggle breakpoint" })
map("n", "<F8>", function()
  dap.restart()
end, { desc = "DAP Restart debug" })
