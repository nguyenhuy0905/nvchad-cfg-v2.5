---@diagnostic disable: redundant-parameter
local dap = require "dap"

-- C/C++/CrabLang
-- dap.adapters.gdb = {
--   type = "executable",
--   command = "gdb",
--   args = {"-i", "dap"}
-- }

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode",
  name = "lldb",
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    args = {},
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
  command = "/usr/local/netcoredbg",
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
