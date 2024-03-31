local noti = require "notify"
noti.setup {
  fps = 60,
  stages = "slide",
}

local msg = "Welcome back. You're currently at " .. vim.fn.getcwd()
noti(msg, vim.log.levels.INFO, {
  title = "Welcome",
})

noti.setup()
