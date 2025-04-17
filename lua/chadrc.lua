-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local highlights = {
  NvimTreeIndentMarker = { fg = "#656565" },
  -- NvimTreeFolderName = { fg = "#8b93f9", bold = true },
  -- NvimTreeFolderIcon = { fg = "#e4a3f5" },
  -- NvimTreeFileName = { fg = "#ffffff" },
  -- NvimTreeOpenedFolderName = { fg = "#ffcc66", bold = true },
}

M.base46 = {
  theme = "yoru",
  hl_override = highlights,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
