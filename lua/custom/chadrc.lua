---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "catppuccin" },
  transparency = false,

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    style = "default",
  },

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal

    -- default/round/block/arrow (separators work only for "default" statusline theme; round and block will work for the minimal theme only)
    separator_style = "round",
    -- overriden_modules = nil,
  },

  tabufline = {
    lazyload = false,
    show_numbers = true,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"
return M
