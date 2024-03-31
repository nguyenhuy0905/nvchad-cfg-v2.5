-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gruvbox",
  transparency = false,
  theme_toggle = {"gruvbox", "gruvbox"},

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  nvdash = {
    load_on_startup = true,
  },
  cheatsheet = {
    theme = "grid",
  },
}

return M
