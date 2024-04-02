-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  transparency = true,
  theme_toggle = { "catppuccin", "gruvbox" },

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
  cmp = {
    style = "flat_dark",
  },
  telescope = {
    style = "bordered"
  },
  statusline = {
    separator_style = "round"
  }
}

return M
