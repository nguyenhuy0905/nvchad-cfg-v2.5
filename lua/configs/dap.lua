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

-- snek
dap.adapters.python = function(cb, config)
  if config.request == "attach" then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or "127.0.0.1"
    cb {
      type = "server",
      port = assert(port, "`connect.port` is required for a python `attach` configuration"),
      host = host,
      options = {
        source_filetype = "python",
      },
    }
  else
    cb {
      type = "executable",
      command = "path/to/virtualenvs/debugpy/bin/python",
      args = { "-m", "debugpy.adapter" },
      options = {
        source_filetype = "python",
      },
    }
  end
end
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
      elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
      else
        return "/usr/bin/python"
      end
    end,
  },
}
