---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "everforest" },
  transparency = true,

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
    overriden_modules = function(modules)
      modules[3] = (function()
        local result, number_of_tabs = "", vim.fn.tabpagenr "$"

        for i = 1, number_of_tabs, 1 do
          local tab_hl = ((i == vim.fn.tabpagenr()) and "%#TbLineTabOn# ") or "%#TbLineTabOff# "
          local tab_name = vim.g.tab_names and vim.g.tab_names["" .. i] or i
          result = result .. ("%" .. i .. "@TbGotoTab@" .. tab_hl .. tab_name .. " ")
          result = (
            number_of_tabs > 1
            and i == vim.fn.tabpagenr()
            and result .. "%#TbLineTabCloseBtn#" .. "%@TbTabCloseCustom@󰅙 %X"
          ) or result
        end

        local new_tabtn = "%#TblineTabNewBtn#" .. "%@TbNewTab@  %X"
        local tabstoggleBtn = "%@TbToggleTabs@%#TBTabTitle# GROUPS %X"

        return vim.g.TbTabsToggled == 1 and tabstoggleBtn:gsub("()", { [30] = " " })
          or new_tabtn .. tabstoggleBtn .. result
      end)()
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"
return M
