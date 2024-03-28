require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- dap
local dap = require "dap"
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

-- neotest
local ntest = require "neotest"
map("n", "<leader>tr", function()
  ntest.run.run { strategy = "dap" }
end, { desc = "Neotest Run nearest test" })

map("n", "<leader>tc", function()
  ntest.run.run(vim.fn.expand "%")
end, { desc = "Neotest Run current file" })

map("n", "<leader>st", function()
  ntest.run.stop()
end, { desc = "Neotest Stop" })

map("n", "<leader>tr", function()
  ntest.run.attach()
end, { desc = "Neotest Attach to nearest test" })
-- linting
local lint = require "lint"
map("n", "<leader>la", function()
  lint.try_lint()
end, { desc = "Lint Try lint" })
