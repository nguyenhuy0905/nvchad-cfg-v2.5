local leap = require("leap")
local map = vim.keymap.set
map({"n", "x", "o"}, "s", "<Plug>(leap-forward)")
map({"n", "x", "o"}, "S", "<Plug>(leap-backward)")
map({"n", "x", "o"}, "Ws", "<Plug>(leap-from-window)")
