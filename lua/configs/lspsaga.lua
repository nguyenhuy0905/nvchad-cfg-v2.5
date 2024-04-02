local saga = require "lspsaga"
saga.setup {
  lightbulb = {
    enable = false,
  },
}
map("n", "<leader>ol", "<cmd>Lspsaga outline<cr>", {desc = "Lspsaga Toggle outline"})
map("n", "<leader>tK", "<cmd>Lspsaga peek_type_definition<cr>", {desc = "LspSaga Peek type definition"})
