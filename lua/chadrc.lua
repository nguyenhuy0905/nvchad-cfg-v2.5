-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  transparency = false,
  theme_toggle = { "catppuccin", "gruvbox" },

  hl_override = {
    NvDashAscii = {
      bg = "NONE",
      fg = "cyan",
    },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  nvdash = {
    header = {
      "            ............,             ",
      "         .';:            :;,,         ",
      "      .;                     ;;.      ",
      "    .:                          :.    ",
      "  .;              .:dddl:.        ;.  ",
      " .:              OWMKOOXMWd        :. ",
      ".:              KMMc    xMMc        :.",
      ",               MMM.     WW:         ,",
      ":               MMM.                 :",
      ":        oxOOOo MMM0OOk.             :",
      ":      0MMKxdd  MMMkddc.             ;",
      ":     XM0       MMM.                 '",
      ":     MMo       MMW.                ; ",
      ":     0MNc     xMMd                ;  ",
      ":      dNMWXXXWM0:               :,   ",
      ":        .:odl:.               :,.    ",
      ":                            :'.      ",
      ".:                      :;,..         ",
      "  '::..............::;,.              ",
    },
    load_on_startup = true,
  },
  cheatsheet = {
    theme = "grid",
  },
  cmp = {
    style = "default",
  },
  telescope = {
    style = "bordered",
  },
  statusline = {
    separator_style = "round",
  },
}

return M
