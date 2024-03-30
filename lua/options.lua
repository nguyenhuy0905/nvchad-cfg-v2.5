require "nvchad.options"

-- add yours here!

-- klocal o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local autocmd = vim.api.nvim_create_autocmd

-- autocmd
autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
vim.cmd [[ autocmd BufRead,BufNewFile *.scad set filetype=openscad ]]
-- user cmd
-- mainly to activate some plugins
local cmd = vim.api.nvim_create_user_command
cmd("NeotestAll", function ()
  require("neotest").run.run(vim.fn.expand "%")
end, {})
cmd("Lint", function ()
  require("lint").try_lint()
end, {})
