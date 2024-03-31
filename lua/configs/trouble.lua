local trouble = require "trouble"
trouble.setup {
  opts = {},
}
-- maps
map("n", "<leader>xx", function()
  trouble.toggle()
end, { desc = "Trouble Toggle trouble panel" })
map("n", "<leader>xq", function()
  trouble.toggle "quickfix"
end, { desc = "Trouble Toggle quick fix" })
