local bufnr = vim.api.nvim_get_current_buf()
local rlsp = vim.cmd.RustLsp

map("n", "<leader>ca", function()
  rlsp "codeAction"
end, { buffer = bufnr, desc = "Rust LSP Code action" })
map("n", "K", function()
  rlsp { "hover", "actions" }
end, { desc = "Rust LSP Hover actions" })
map("n", "<F5>", function ()
  rlsp "debuggables"
end)
