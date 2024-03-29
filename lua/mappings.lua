require "nvchad.mappings"

-- add yours here

map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- tabufline
map("n", "<leader>wqa", function()
  require("nvchad.tabufline").closeAllBufs()
  vim.cmd "wall"
  vim.cmd "qall"
end, { desc = "Buffer close save all" })
-- activate Neotest
map("n", "<leader>tc", ":NeotestAll<cr>", { desc = "Neotest Run current file" })
-- activate nvim-lint
map("n", "<leader>la", ":Lint<cr>", { desc = "Lint Try lint" })
