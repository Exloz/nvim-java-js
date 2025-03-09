-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",
  transparent = true,
}

M.ui = {
  cmp = {
    icons_left = false,
    style = "atom_colored",
    format_colors = {
      tailwind = true,
    }
  },
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  tabufline = {
    enabled = true,
  }
}

M.nvdash = {
  load_on_startup = true
}


return M
