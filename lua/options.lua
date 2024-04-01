require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.termguicolors = true
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
o.foldcolumn = "1"
o.foldlevel = 99
o.conceallevel = 2

-- autocmd
local autocmd = vim.api.nvim_create_autocmd
vim.notify = require "notify"
autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
autocmd({ "LspAttach" }, {
  callback = function()
    require "trouble"
  end,
})
-- user cmd
-- mainly to activate some plugins
-- adds a new filetype called scad
vim.cmd [[ autocmd BufRead,BufNewFile *.scad set filetype=openscad ]]
local cmd = vim.api.nvim_create_user_command
cmd("NeotestAll", function()
  require("neotest").run.run(vim.fn.expand "%")
end, {})
cmd("Lint", function()
  require("lint").try_lint()
end, {})
cmd("Neogit", function()
  require("neogit").open()
end, {})
