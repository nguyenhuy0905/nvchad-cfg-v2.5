local neogit = require "neogit"
neogit.setup {}
-- mapping
map("n", "<leader>oc", function()
  neogit.open { "commit" }
end, { desc = "Neogit Open commit" })
map("n", "<leader>og", function()
  neogit.open()
end, { desc = "Neogit Open" })
-- autocmds
local group = vim.api.nvim_create_augroup("MyCustomNeogitEvent", { clear = true})
autocmd("User", {
  pattern = "NeogitPushComplete",
  group = group,
  callback = neogit.close,
})
autocmd("User", {
  pattern = "NeogitCommitComplete",
  group = group,
  callback = neogit.open,
})