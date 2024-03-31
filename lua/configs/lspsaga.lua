local saga = require "lspsaga"
saga.setup {
  lightbulb = {
    enable = false,
  },
}
map("n", "<leader>ol", "<cmd>Lspsaga outline<cr>")
