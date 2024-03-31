local zen = require "zen-mode"
zen.setup {
  window = {
    width = 150,
  },
  gitsign = { enabled = true },
  tmux = { enabled = true },
}
vim.keymap.set("n", "<leader>tz", function()
  zen.toggle()
end, { desc = "Zen Toggle zen mode" })
